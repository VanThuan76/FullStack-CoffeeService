import { Request, Response } from "express";
import { Following } from "../models/following";
export const listCustomerFollow = async (req: Request, res: Response) => {
    try {
        const customerId = req.params.customerId;
        const following = await Following.getFollowingCustomers(Number(customerId));
        if (following.length > 0) {
            return res.status(200).json(following);
        }
        return res.status(200).json([]);
    } catch (error) {
        return res.status(500).json({ message: 'Internal server error' });
    }
}
export const listUserFollow = async (req: Request, res: Response) => {
    try {
        const userId = req.params.userId;
        const followings = await Following.getFollowingUsers(Number(userId));
        if (followings.length > 0) {
            return res.status(200).json(followings);
        }
        return res.status(200).json([]);
    } catch (error) {
        return res.status(500).json({ message: 'Internal server error' });
    }
}
export const follow = async (req: Request, res: Response) => {
    try {
        const follow = req.body;
        await Following.addFollow(follow);
        return res.status(200).send('Followed successfully');
    } catch (error) {
        return res.status(400).json({ message: 'Error following user/customer' });
    }
}
export const unfollow = async (req: Request, res: Response) => {
    try {
        const follow = req.body;
        await Following.removeFollow(follow);
        return res.status(200).send('Unfollowed successfully');
    } catch (error) {
        return res.status(400).json({ message: 'Error unfollowing user/customer' });
    }
}