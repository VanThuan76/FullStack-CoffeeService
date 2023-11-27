import { AxiosResponse } from 'axios';
import { httpsNoToken } from '../config/http.config';
import { ISchedule } from '../types/schedule.type';


class ScheduleService {
    getCustomerSchedule(customerId: number): Promise<AxiosResponse<ISchedule[]>> {
        return httpsNoToken.get(`/Schedule/Customer/${customerId}`)
    }
    getUserSchedule(userId: number): Promise<AxiosResponse<ISchedule[]>> {
        return httpsNoToken.get(`/Schedule/User/${userId}`)
    }
    bookSchedule(body: any) {
        return httpsNoToken.post("/Schedule/Book", body)
    }
    getVnpay(): Promise<AxiosResponse<any>> {
        return httpsNoToken.get(`/Vnpay`)
    }
    updateSchedule(body: ISchedule) {
        return httpsNoToken.put(`/Schedule/Update`, body)
    }
    getScheduleById(id: number): Promise<AxiosResponse<ISchedule>> {
        return httpsNoToken.get(`/Schedule/Detail/${id}`)
    }
    deleteSchedule(id: number) {
        return httpsNoToken.delete(`/Schedule/Delete?scheduleId=${id}`)
    }
}

export const scheduleService = new ScheduleService()
