import { UseUser } from '../stores/UseUser';
import { Navigate, Outlet } from "react-router-dom";

export const ProtectedAuthRoute = ({ redirectPath = '/' }) => {
    const isLogged = UseUser((state) => state.login);
    if (!isLogged) {
        return <Navigate to={redirectPath} replace />;
    }

    return <Outlet />;
};

export default ProtectedAuthRoute