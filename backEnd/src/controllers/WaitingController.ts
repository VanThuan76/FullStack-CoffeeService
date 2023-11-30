import { Request, Response } from "express";
import { Waiting } from "../models/waiting";
import { Customer } from "../models/customer";
import { Op } from "sequelize";
export const listWaiting = async (req: Request, res: Response) => {
  try {
    const customers = await Customer.findAll();
    const customerIds = customers.map((customer) => customer.customer_id);
    const info = await Waiting.findAll({
      where: {
        customer_id: {
          [Op.notIn]: customerIds,
        },
      },
    });

    res.status(200).json(info);
  } catch (error) {
    res.status(500).json({ message: error });
  }
};

export const requestWaiting = async (req: Request, res: Response) => {
  const { customerId } = req.query;
  // @ts-ignore
  const customer = await Customer.findByPk(customerId as unknown as number);
  try {
    if (customer) {
      await Waiting.requestWaiting({
        customer_id: customer?.customer_id,
        address: customer?.address,
        email: customer?.email,
        phone: customer?.phone,
        coffeeShopName: customer?.name,
      });
      res.status(200).json({ message: "Waiting record added successfully" });
    }
  } catch (error) {
    res.status(400).json({ message: error });
  }
};
export const acceptWaiting = async (req: Request, res: Response) => {
  const { id } = req.query;
  try {
    // @ts-ignore
    const waiting = await Waiting.findByPk(id as number);
    const customer = await Customer.findByPk(waiting?.customer_id as number);
    if (waiting && customer) {
      const userData = {
        address: waiting?.address,
        phone: waiting?.phone,
        coffeeShopName: waiting?.coffeeShopName,
        account_id: customer.account_id,
        email: customer?.email,
        avatar: customer?.avatar,
      };
      await Waiting.acceptWaiting(userData);
      res.status(200).json({ message: "Waiting record added successfully" });
    }
  } catch (error) {
    res.status(400).json({ message: error });
  }
};
export const denyWaiting = async (req: Request, res: Response) => {
  const { id } = req.query;
  try {
    await Waiting.denyWaiting(id);
    res.status(200).json({ message: "Waiting record denied" });
  } catch (error) {
    res.status(400).json({ message: error });
  }
};
