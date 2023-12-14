import { PreImage } from '@/components/common/PreImage';
import { useAppSelector } from '@/hooks/useRedux';
import { useMutation } from '@tanstack/react-query';
import { Button, message } from 'antd';
import { useState } from 'react';
import { followingService } from 'src/shared/services/following.service';
import { IFollowing, IFollowingAdd } from 'src/shared/types/following.type';

interface Props {
  followingData: IFollowing[];
  userType: string;
  loggedInUserId: number;
}

const Following = ({ followingData, userType, loggedInUserId }: Props) => {
  const user = useAppSelector(state => state.appSlice.user);
  const followingShop = useMutation({
    mutationKey: ['followingShopMutaion'],
    mutationFn: (body: IFollowingAdd) => followingService.newFollowing(body),
    onSuccess: () => {
      message.success('Xoá thành công');
    },
    onError() {
      message.error('Xoá không thành công');
    },
  });

  // Lọc ra các User mà Customer đang đăng nhập đã theo dõi
  const filteredFollowingData = followingData.filter(item => {
    if (userType === 'Customer') {
      return item.user.userId === loggedInUserId;
    } else {
      return item.customer.customerId === loggedInUserId;
    }
  });

  const unFollowMutation = useMutation((followingData: IFollowingAdd) => followingService.newFollowing(followingData), {
    onError: () => {
      message.error('Theo dõi không thành công');
    },
  });
  const unFollowHandle = async (brandId: number, isFollowing: boolean): Promise<void> => {
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
      await unFollowMutation.mutateAsync(followingData);
    }
  };
  return (
    <section
      id='Following'
      className='w-full flex flex-col justify-around items-center mx-auto px-4 md:px-12 lg:px-32 pb-24'
    >
      <div className='relative w-full mt-5 pb-32 grid grid-cols-1 sm:gird-cols-2 md:grid-cols-3 lg:grid-cols-4 items-start justify-between gap-10'>
        {followingData.length === 0 ? (
          // Hiển thị thông báo nếu không có ai được theo dõi
          <div className='mt-5'>
            <p className='font-medium text-2xl'>
              Hiện bạn chưa Follow Cửa Hàng nào cả, bấm vào{' '}
              <a href='/shopList' className='underline text-red-500'>
                đây
              </a>{' '}
              để truy cập List các quán Coffee.
            </p>
          </div>
        ) : (
          // Hiển thị danh sách theo dõi nếu có
          followingData.map((item, idx) => (
            <div className='mt-5' key={idx}>
              <PreImage
                src={item.user.avatar}
                height={200}
                width={200}
                layer={false}
                alt={item.user.coffeeShopName}
                className='rounded-md cursor-pointer object-cover border-2 light:border-slate-700 border-slate-100'
              />
              <div className='w-full pt-15 flex justify-between items-center gap-5 light:text-black'>
                <div className='w-full flex flex-col justify-start items-start gap-3'>
                  <p className='font-medium text-2xl'>
                    {/* @ts-ignore */}
                    Tên: {item.user.coffeeShopName}
                  </p>
                  <p className='font-thin text-sm'>Địa chỉ: {item.user.address}</p>
                  <p className='font-thin text-sm'>Email: {item.user.email}</p>
                  <p className='font-thin text-sm'>Sđt: {item.user.phone}</p>
                  <Button className='dark:text-white' onClick={() => unFollowHandle(item.followingId, item.followed)}>
                    {item.followed ? 'Đang Theo Dõi' : 'Theo Dõi'}
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

export default Following;
