import { Association, DataTypes, Model, Optional } from 'sequelize';
import { sequelize } from '../db'
import { GroupImage } from './groupImage';
import { Location } from './location';
import { Schedule } from './schedule';
import { User } from './user';

export interface EventAttributes {
    event_id: number;
    name: string;
    location_id: number;
    date: Date;
    groupImage_id: number;
    description: string;
    start_time: Date;
    end_time: Date;
    seat_count: number;
    price: number;
    user_id: number;
}

interface EventCreationAttributes extends Optional<EventAttributes, 'event_id'> { }

class Event extends Model<EventAttributes, EventCreationAttributes> implements EventAttributes {
    public event_id!: number;
    public name!: string;
    public location_id!: number;
    public date!: Date;
    public groupImage_id!: number;
    public description!: string;
    public start_time!: Date;
    public end_time!: Date;
    public seat_count!: number;
    public price!: number;
    public user_id!: number;
    public createdAt!: Date;
    public updatedAt!: Date;
    public readonly location?: Location;
    public readonly groupImage?: GroupImage;
    public readonly user?: User;
    public readonly schedule?: Schedule;
    public static associations: {
        location: Association<Event, Location>;
        groupImage: Association<Event, GroupImage>;
        user: Association<Event, User>;
        schedule: Association<Event, Schedule>;
    };
    static async getEvents(): Promise<Event[]> {
        const events = await Event.findAll();
        return events
    }
    static async getUserEvents(userId: number): Promise<Event[]> {
        const events = await Event.findAll({
            where: {
                user_id: userId
            }
        });
        return events
    }
    static async addEvent(eventData: EventAttributes): Promise<Event> {
        try {
            const event = await Event.create(eventData);
            return event;
        } catch (error) {
            throw new Error('Unable to add banner');
        }
    }
    static async getDetailEvent(eventId: number): Promise<Event | null> {
        try {
            const event = await Event.findByPk(eventId);
            return event;
        } catch (error) {
            throw new Error('Not found');
        }
    }
    static async updateEvent(updatedData: Partial<EventAttributes>): Promise<[number, Event[]]> {
        try {
            const [updatedRowsCount, updatedEvents] = await Event.update(updatedData, {
                where: { event_id: updatedData.event_id },
                returning: true,
            });

            if (updatedRowsCount === 0 || !updatedEvents || updatedEvents.length === 0) {
                throw new Error('Banner not found or unable to update');
            }

            return [updatedRowsCount, updatedEvents];
        } catch (error) {
            throw new Error('Unable to update banner');
        }
    }
    static async deleteEvent(eventId: number) {
        try {
            await Event.destroy({
                where: { event_id: eventId },
            });
            return 0;
        } catch (error) {
            throw new Error('Unable to delete banner');
        }
    }
}

Event.init(
    {
        event_id: {
            type: DataTypes.INTEGER.UNSIGNED,
            autoIncrement: true,
            primaryKey: true,
        },
        name: {
            type: new DataTypes.STRING(1045),
            allowNull: false,
        },
        location_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        date: {
            type: DataTypes.DATE,
            allowNull: false,
        },
        groupImage_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        description: {
            type: new DataTypes.STRING(1045),
            allowNull: false,
        },
        start_time: {
            type: DataTypes.DATE,
            allowNull: false,
        },
        end_time: {
            type: DataTypes.DATE,
            allowNull: false,
        },
        seat_count: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        price: {
            type: new DataTypes.DECIMAL(10, 2),
            allowNull: false,
        },
        user_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
    },
    {
        tableName: 'Event',
        sequelize: sequelize,
    }
);
export { Event };
Event.belongsTo(GroupImage, { foreignKey: 'groupImage_id', as: 'groupImage' });
Event.hasOne(Schedule, { foreignKey: 'event_id', as: 'schedule' });
