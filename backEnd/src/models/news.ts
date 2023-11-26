import { Association, DataTypes, Model, Optional } from 'sequelize';
import { sequelize } from '../db'
import { GroupImage } from './groupImage';
import { User } from './user';

interface NewsAttributes {
    news_id: number;
    user_id: number;
    title: string;
    description: string;
    groupImage_id: number;
    created_date: Date
}

interface NewsCreationAttributes extends Optional<NewsAttributes, 'news_id'> { }

class News extends Model<NewsAttributes, NewsCreationAttributes> implements NewsAttributes {
    public news_id!: number;
    public user_id!: number;
    public title!: string;
    public description!: string;
    public groupImage_id!: number;
    public created_date!: Date;
    public createdAt!: Date;
    public updatedAt!: Date;
    public readonly user?: User;
    public readonly groupImage?: GroupImage;
    public static associations: {
        user: Association<News, User>;
        groupImage: Association<News, GroupImage>;
    };
    static async listNews(): Promise<News[]> {
        const news = await News.findAll();
        return news
    }
    static async getUserNews(userId: number): Promise<News[]> {
        const events = await News.findAll({
            where: {
                user_id: userId
            }
        });
        return events
    }
    static async detailNews(news_id: number): Promise<News | null> {
        try {
            const news = await News.findByPk(news_id);
            return news;
        } catch (error) {
            throw new Error('Not found');
        }
    }
    static async addNews(newsData: NewsAttributes): Promise<News> {
        try {
            const news = await News.create(newsData);
            return news;
        } catch (error) {
            throw new Error('Unable to add news');
        }
    }
    static async updateNews(updatedData: Partial<NewsAttributes>): Promise<[number, News[]]> {
        try {
            const [updatedRowsCount, updatedNews] = await News.update(updatedData, {
                where: { news_id: updatedData.news_id },
                returning: true,
            });

            if (updatedRowsCount === 0 || !updatedNews || updatedNews.length === 0) {
                throw new Error('Banner not found or unable to update');
            }

            return [updatedRowsCount, updatedNews];
        } catch (error) {
            throw new Error('Unable to update banner');
        }
    }
    static async deleteNews(newsId: number) {
        try {
            await News.destroy({
                where: { news_id: newsId },
            });
            return 0;
        } catch (error) {
            throw new Error('Unable to delete news');
        }
    }
}

News.init(
    {
        news_id: {
            type: DataTypes.INTEGER.UNSIGNED,
            autoIncrement: true,
            primaryKey: true,
        },
        user_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        title: {
            type: new DataTypes.STRING(100),
            allowNull: false,
        },
        description: {
            type: new DataTypes.STRING(1045),
            allowNull: false,
        },
        groupImage_id: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        created_date: {
            type: DataTypes.DATE,
            allowNull: false,
        }
    },
    {
        tableName: 'News',
        sequelize: sequelize,
    }
);
export { News };
