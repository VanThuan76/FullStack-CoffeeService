import { Request, Response } from "express";
import { Event } from "../models/event";
export const listEvent = async (req: Request, res: Response) => {
    try {
        const events = await Event.getEvents();
        if (events.length > 0) {
            return res.status(200).json(events);
        }
        return res.status(404).json({ message: 'No events found' });
    } catch (error) {
        return res.status(500).json({ message: 'Internal server error' });
    }
}
export const addEvent = async (req: Request, res: Response) => {
    try {
        const eventInfo = req.body;
        await Event.addEvent(eventInfo);
        return res.status(200).send('Event added successfully');
    } catch (error) {
        return res.status(400).json({ message: 'Error adding event' });
    }
}
export const detailEvent = async (req: Request, res: Response) => {
    try {
        const eventId = req.params.id;
        const eventInfo = await Event.getDetailEvent(Number(eventId));
        if (eventInfo) {
            return res.status(200).json(eventInfo);
        }
        return res.status(404).json({ message: 'Event not found' });
    } catch (error) {
        return res.status(500).json({ message: 'Internal server error' });
    }
}
export const updateEvent = async (req: Request, res: Response) => {
    try {
        const eventInfo = req.body;
        await Event.updateEvent(eventInfo);
        return res.status(200).send('Event updated successfully');
    } catch (error) {
        return res.status(400).json({ message: 'Error updating event' });
    }
}
export const deleteEvent = async (req: Request, res: Response) => {
    try {
        const eventId = req.params.id;
        await Event.deleteEvent(Number(eventId));
        return res.status(200).send('Event deleted successfully');
    } catch (error) {
        return res.status(400).json({ message: 'Error deleting event' });
    }
}
export const eventByUser = async (req: Request, res: Response) => {
    try {
        const userId = req.params.userId;
        const userEvents = await Event.getUserEvents(Number(userId));
        if (userEvents.length > 0) {
            return res.status(200).json(userEvents);
        }
        return res.status(404).json({ message: 'No events found for the user' });
    } catch (error) {
        return res.status(500).json({ message: 'Internal server error' });
    }
}