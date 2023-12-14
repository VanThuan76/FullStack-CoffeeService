import React, { useState, useEffect } from 'react';
import { Button, message } from 'antd';
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import { followingService } from 'src/shared/services/following.service'; // Sử dụng followingService
import { ICustomer } from 'src/shared/types/customer.type';
import { PreImage } from '@/components/common/PreImage';
import { useAppSelector } from '@/hooks/useRedux';
import { IFollowingAdd } from 'src/shared/types/following.type';

interface Props {
  brandsData: ICustomer[];
}

const BrandList = ({ brandsData }: Props) => {
  const user = useAppSelector(state => state.appSlice.user);
  const queryClient = useQueryClient();

  const { data: brandDataFollowing, isLoading: brandDataFollowingLoading } = useQuery(['listBrands'], () => {
    return followingService.getCustomerList(parseInt(user?.id || '0', 10)); // Sử dụng followingService
  });

  const followMutation = useMutation((followingData: IFollowingAdd) => followingService.newFollowing(followingData), {
    onMutate: followingData => {
      const updatedBrandData = brandDataFollowing?.data.map(brand => {
        if (brand.user.userId === Number(followingData.user.userId)) {
          return { ...brand, isFollowing: true };
        }
        return brand;
      });

      queryClient.setQueryData(['listBrands'], updatedBrandData);
    },
    onError: () => {
      message.error('Theo dõi không thành công');
    },
  });

  const unfollowMutation = useMutation<void, unknown, IFollowingAdd>(
    async followingData => {
      try {
        await followingService.unfollow(followingData);
      } catch (error) {
        throw error;
      }
    },
    {
      onMutate: followingData => {
        const updatedBrandData = brandDataFollowing?.data.map(brand => {
          if (brand.user.userId === parseInt(followingData.user.userId, 10)) {
            return { ...brand, isFollowing: false };
          }
          return brand;
        });

        queryClient.setQueryData(['listBrands'], updatedBrandData);
      },
      onError: () => {
        message.error('Hủy theo dõi không thành công');
      },
    },
  );

  useEffect(() => {
    const fetchFollowingLists = async () => {
      if (user && !brandDataFollowingLoading && Array.isArray(brandDataFollowing)) {
        // Kiểm tra brandData là một mảng
        const updatedBrandData = brandDataFollowing.map(brand => {
          const isFollowingCustomer = brand.followingId !== null; // Xác định trạng thái theo dõi

          return { ...brand, isFollowing: isFollowingCustomer };
        });

        queryClient.setQueryData(['listBrands'], updatedBrandData);
      }
    };

    fetchFollowingLists();
  }, [user, brandDataFollowing, brandDataFollowingLoading, queryClient]);

  const handleFollowClick = async (brandId: number, isFollowing: boolean): Promise<void> => {
    if (!user) {
      message.warning('Vui lòng đăng nhập để theo dõi.');
      return;
    }
    // @ts-ignore
    const brand = brandsData?.find(brand => brand.user_id === brandId);
    if (!brand) {
      message.error('Không tìm thấy thông tin người dùng.');
      return;
    }
    const followingData: any = {
      customer_id: user.id,
      // @ts-ignore
      user_id: brand.user_id, // Sử dụng ID người dùng của thương hiệu
    };

    if (isFollowing) {
      await unfollowMutation.mutateAsync(followingData);
    } else {
      await followMutation.mutateAsync(followingData);
    }
  };
  return (
    <section className='w-full flex flex-col justify-around items-center mx-auto px-4 md:px-12 lg:px-32 pb-24'>
      <div className='relative w-full mt-5 pb-32 grid grid-cols-1 sm:gird-cols-2 md:grid-cols-3 lg:grid-cols-4 items-start justify-between gap-10'>
        {brandDataFollowingLoading ? (
          <p>Loading...</p>
        ) : brandDataFollowing?.data ? (
          brandDataFollowing?.data.map((brand, idx) => (
            <div className='mt-5' key={idx}>
              <PreImage
                src={brand.user.avatar}
                height={200}
                width={200}
                layer={false}
                alt={brand.user.coffeeShopName}
                className='rounded-md cursor-pointer object-cover border-2 light:border-slate-700 border-slate-100'
              />
              <div className='w-full pt-15 flex justify-between items-center gap-5 light:text-black'>
                <div className='w-full flex flex-col justify-start items-start gap-3'>
                  <p className='font-medium text-2xl'>Tên: {brand.user.coffeeShopName}</p>
                  <p className='font-thin text-sm'>Địa chỉ: {brand.user.address}</p>
                  <p className='font-thin text-sm'>Email: {brand.user.email}</p>
                  <p className='font-thin text-sm'>Sđt: {brand.user.phone}</p>
                  <Button
                    className='dark:text-white'
                    onClick={() => handleFollowClick(brand.user.userId, brand.followed)}
                  >
                    {brand.followed ? 'Đang Theo Dõi' : 'Theo Dõi'}
                  </Button>
                </div>
              </div>
            </div>
          ))
        ) : (
          Array.isArray(brandsData) &&
          brandsData.map((brand, idx) => (
            <div className='mt-5' key={idx}>
              <PreImage
                //@ts-ignore
                src={brand.avatar}
                height={200}
                width={200}
                layer={false}
                //@ts-ignore
                alt={brand.coffeeShopName}
                className='rounded-md cursor-pointer object-cover border-2 light:border-slate-700 border-slate-100'
              />
              <div className='w-full pt-15 flex justify-between items-center gap-5 light:text-black'>
                <div className='w-full flex flex-col justify-start items-start gap-3'>
                  <p className='font-medium text-2xl'>
                    {/* @ts-ignore */}
                    Tên: {brand.coffeeShopName}
                  </p>
                  <p className='font-thin text-sm'>Địa chỉ: {brand.address}</p>
                  <p className='font-thin text-sm'>Email: {brand.email}</p>
                  <p className='font-thin text-sm'>Sđt: {brand.phone}</p>
                  <Button
                    className='dark:text-white'
                    /* @ts-ignore */
                    onClick={() => handleFollowClick(brand.account_id, brand.followed | false)}
                  >
                    {/* @ts-ignore */}
                    {brand.followed ? 'Đang Theo Dõi' : 'Theo Dõi'}
                  </Button>
                </div>
              </div>
            </div>
          ))
        )}
      </div>
    </section>
  );
};

export default BrandList;
