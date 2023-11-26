import { Association, DataTypes, Model, Optional, where } from 'sequelize';
import { sequelize } from '../db'
import { Customer, CustomerAttributes } from './customer';
import { Event, EventAttributes } from './event';
import { User } from './user';

interface IScheduleBook {
    scheduleId: string;
    event: EventAttributes;
    customer: CustomerAttributes;
    ticketCount: number;
}

interface ScheduleAttributes {
    schedule_id: number;
    event_id: number;
    user_id: number;
    customer_id: number;
    ticket_count: number;
}

interface ScheduleCreationAttributes extends Optional<ScheduleAttributes, 'schedule_id'> { }

class Schedule extends Model<ScheduleAttributes, ScheduleCreationAttributes> implements ScheduleAttributes {
    public schedule_id!: number;
    public event_id!: number;
    public user_id!: number;
    public customer_id!: number;
    public ticket_count!: number;
    public createdAt!: Date;
    public updatedAt!: Date;
    public readonly event?: Event;
    public readonly customer?: Customer;
    public static associations: {
        event: Association<Schedule, Event>;
        user: Association<Schedule, User>;
        customer: Association<Schedule, Customer>;
    };
    static async getSchedulesByUser(userId: number): Promise<Schedule[]> {
        const schedules = await Schedule.findAll({
            where: {
                user_id: userId
            }
        });
        return schedules
    }
    static async getSchedulesByCustomer(customerId: number): Promise<Schedule[]> {
        const schedules = await Schedule.findAll({
            where: {
                customer_id: customerId
            }
        });
        return schedules
    }
    static async bookSchedule(scheduleData: IScheduleBook) {
        try {
            const newSchedule = await Schedule.create({
                // @ts-ignore
                event_id: scheduleData.event.eventId,
                // @ts-ignore
                user_id: scheduleData.customer.customerId,
                // @ts-ignore
                customer_id: scheduleData.customer.customerId,
                ticket_count: scheduleData.ticketCount,
                // Thêm các trường dữ liệu khác tương ứng
            });
            return newSchedule;
        } catch (error) {
            throw new Error('Unable to book schedule');
        }
    }
    static async updateSchedule(scheduleId: number, scheduleData: IScheduleBook) {
        try {
            const updateSchedule = await Schedule.update(
                {
                    // @ts-ignore
                    event_id: scheduleData.event.eventId,
                    // @ts-ignore
                    user_id: scheduleData.customer.customerId,
                    // @ts-ignore
                    customer_id: scheduleData.customer.customerId,
                    ticket_count: scheduleData.ticketCount,
                    // Thêm các trường dữ liệu khác tương ứng
                },
                {
                    where: { schedule_id: scheduleId }
                });
            return updateSchedule;
        } catch (error) {
            throw new Error('Unable to book schedule');
        }
    }
    static async deleteSchedule(scheduleId: number) {
        try {
            await Schedule.destroy({
                where: { schedule_id: scheduleId },
            });
            return 0;
        } catch (error) {
            throw new Error('Unable to delete banner');
        }
    }
}

Schedule.init(
    {
        schedule_id: {
            type: DataTypes.INTEGER.UNSIGNED,
            autoIncrement: true,
            primaryKey: true,
        },
        user_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        event_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        customer_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        ticket_count: {
            type: DataTypes.INTEGER,
            allowNull: false,
        }
    },
    {
        tableName: 'Schedule',
        sequelize: sequelize,
    }
);
export { Schedule };