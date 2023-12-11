import { BsCartCheck } from "react-icons/bs";
import { HiOutlineInboxStack } from "react-icons/hi2";
import { MdOutlineFavoriteBorder } from "react-icons/md";
import { CgProfile } from "react-icons/cg";

export const NavLinks = [
    {
        id: 1,
        title: "Orders",
        link: "orders",
        icon: <HiOutlineInboxStack />,
    },
    {
        id: 2,
        title: "Cart",
        link: "cart",
        icon: <BsCartCheck />,
    },
    {
        id: 3,
        title: "Favorites",
        link: "favorites",
        icon: <MdOutlineFavoriteBorder />,
    },
    {
        id: 4,
        title: "Profile",
        link: "profile",
        icon: <CgProfile />,
    },
]