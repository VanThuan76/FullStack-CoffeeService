import Dashboard from '@/components/layout/dashboard/DashboardLayout';
import { EditOutlined } from '@ant-design/icons';
import { Button, Col, Row, Space, Table } from 'antd';
import Search from 'antd/lib/input/Search';
import { ColumnType } from 'antd/lib/table';
import { useState } from 'react';
import { useQuery } from '@tanstack/react-query';
// import FormCustomer from './form';
import { customerService } from 'src/shared/services/customer.service';
import { ICustomer } from 'src/shared/types/customer.type';
import { followingService } from 'src/shared/services/following.service';
import { useAppSelector } from '@/hooks/useRedux';

type Props = {};

const CustomerManagement = ({}: Props) => {
  const { user } = useAppSelector(state => state.appSlice);

  const { data: dataCustomer, refetch } = useQuery(['listCustomer'], () => customerService.getAllCustomer());
  const { data: dataCustomerFollowing } = useQuery(
    ['listCustomerFollowing'],
    () => followingService.getUserList(Number(user?.id)),
    { enabled: user?.role === 'User' },
  );

  const columns: ColumnType<ICustomer>[] = [
    {
      title: '#',
      key: 'id',
      render: (_, record, index) => (
        <div>
          <p>{index}</p>
        </div>
      ),
    },
    {
      title: 'Tên khách hàng',
      dataIndex: 'name',
      key: 'name',
    },
    {
      title: 'Số điện thoại',
      dataIndex: 'phone',
      key: 'phone',
    },
    {
      title: 'Địa chỉ',
      dataIndex: 'address',
      key: 'address',
    },
    {
      title: 'Email',
      dataIndex: 'email',
      key: 'email',
    },
  ];

  return (
    <>
      {dataCustomer && user?.role !== 'User' ? (
        <>
          <Row className='mb-12' justify={'space-between'} align='middle' gutter={16}>
            <Col span={12}>
              <h1 className='font-bold text-2xl  text-black'>Quản lý khách hàng</h1>
            </Col>
            <Col span={12}>
              <div className='flex py-2 justify-between items-center gap-3'>
                <Search className='bg-blue-300 rounded-lg' placeholder='Tìm kiếm' onSearch={() => {}} enterButton />
              </div>
            </Col>
          </Row>
          <Table dataSource={dataCustomer.data} columns={columns} />
        </>
      ) : dataCustomerFollowing && (
        <>
          <Row className='mb-12' justify={'space-between'} align='middle' gutter={16}>
            <Col span={12}>
              <h1 className='font-bold text-2xl  text-black'>Quản lý khách hàng</h1>
            </Col>
            <Col span={12}>
              <div className='flex py-2 justify-between items-center gap-3'>
                <Search className='bg-blue-300 rounded-lg' placeholder='Tìm kiếm' onSearch={() => {}} enterButton />
              </div>
            </Col>
          </Row>
          <Table dataSource={dataCustomerFollowing.data} columns={columns} />
        </>
      )}
    </>
  );
};
CustomerManagement.getLayout = (children: React.ReactNode) => <Dashboard>{children}</Dashboard>;
export default CustomerManagement;
