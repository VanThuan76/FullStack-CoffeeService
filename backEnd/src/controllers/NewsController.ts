import { Request, Response } from "express";
import { News } from "../models/news";
export const listNews = async (req: Request, res: Response) => {
    try {
        const news = await News.listNews();
        return res.status(200).json(news);
    } catch (error) {
        return res.status(500).json({ message: 'Internal server error' });
    }
}
export const detailNews = async (req: Request, res: Response) => {
    const newsId = req.params.id;
    try {
        const news = await News.detailNews(Number(newsId));
        if (news) {
            return res.status(200).json(news);
        }
        return res.status(404).json({ message: 'News not found' });
    } catch (error) {
        return res.status(500).json({ message: 'Internal server error' });
    }
}
export const addNews = async (req: Request, res: Response) => {
    const newsData = req.body;
    try {
        await News.addNews(newsData);
        return res.status(200).json({ message: 'News created successfully' });
    } catch (error) {
        return res.status(400).json({ message: 'Unable to create news' });
    }
}
export const updateNews = async (req: Request, res: Response) => {
    const newsData = req.body;
    try {
        await News.updateNews(newsData);
        return res.status(200).json({ message: 'News updated successfully' });
    } catch (error) {
        return res.status(400).json({ message: 'Unable to update news' });
    }
}
export const deleteNews = async (req: Request, res: Response) => {
    const newsId = req.params.id;
    try {
        await News.deleteNews(Number(newsId));
        return res.status(200).json({ message: 'News deleted successfully' });
    } catch (error) {
        return res.status(400).json({ message: 'Unable to delete news' });
    }
}
export const newsByUser = async (req: Request, res: Response) => {
    const userId = req.params.userId;
    try {
        const userNews = await News.getUserNews(Number(userId));
        if (userNews.length > 0) {
            return res.status(200).json(userNews);
        }
        return res.status(404).json({ message: 'No news found for this user' });
    } catch (error) {
        return res.status(500).json({ message: 'Internal server error' });
    }
}