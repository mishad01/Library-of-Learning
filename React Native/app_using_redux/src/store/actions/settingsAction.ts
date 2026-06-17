import { CHANGE_ROLE } from "../types";

export const changeRole = (role: String) => ({
    type: CHANGE_ROLE,
    payload: role
})