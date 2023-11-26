import { Association, DataTypes, Model, Optional } from 'sequelize';
import { sequelize } from '../db'
import { Customer } from './customer';

interface WaitingAttributes {
    waiting_id: number;
    customer_id: number;
    address: string;
    email: string;
    phone: string;
    coffeeShopName: string;
}

interface WaitingCreationAttributes extends Optional<WaitingAttributes, 'waiting_id'> { }

class Waiting extends Model<WaitingAttributes, WaitingCreationAttributes> implements WaitingAttributes {
    public waiting_id!: number;
    public customer_id!: number;
    public address!: string;
    public email!: string;
    public phone!: string;
    public coffeeShopName!: string;
    public createdAt!: Date;
    public updatedAt!: Date;
    public readonly customer?: Customer;
    public static associations: {
        customer: Association<Waiting, Customer>;
    };
}

Waiting.init(
    {
        waiting_id: {
            type: DataTypes.INTEGER.UNSIGNED,
            autoIncrement: true,
            primaryKey: true,
        },
        customer_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        address: {
            type: new DataTypes.STRING(150),
            allowNull: false,
        },
        email: {
            type: new DataTypes.STRING(30),
            allowNull: false,
        },
        phone: {
            type: new DataTypes.STRING(15),
            allowNull: false,
        },
        coffeeShopName: {
            type: new DataTypes.STRING(50),
            allowNull: false,
        }
    },
    {
        tableName: 'Waiting',
        sequelize: sequelize,
    }
);
export { Waiting };
