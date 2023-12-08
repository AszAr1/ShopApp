import { Navigate, Outlet } from "react-router-dom";
import { useUser } from "../stores/user";

export const ProtectedRoute = ({ redirectPath = '/' }) => {
    const isLogged = useUser((state) => state.login);
    if (!isLogged) {
        return <Navigate to={redirectPath} replace />;
    }

    return <Outlet />;
};