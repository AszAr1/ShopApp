import React from "react";
import {BsTelegram} from "react-icons/bs";
import {GrInstagram} from "react-icons/gr"
import {SlSocialVkontakte} from "react-icons/sl"
import Brands from "./Brands";

function Footer () {
    return (
        <>
            <div className={`w-full flex justify-between items-center flex-col sm:flex-row sm:px-24 px-6 py-8
                text-white bg-black mb-auto
            `}>
                <div className={`flex justify-center items-center flex-col`}>
                    <h1 className={`text-2xl font-bold font-sans`}>SneakerShop</h1>
                </div>
                <Brands/>
                <div className={`flex justify-center items-center flex-col`}>
                    <h1 className={`text-xl font-bold font-sans mb-3`}>Наши мессенджеры</h1>
                    <div className={`flex justify-center items-center flex-row`}>
                        <a href={`telegram`}><BsTelegram className={`text-4xl text-white transition duration-500 hover:scale-110`}/></a>
                        <a href={`instagram`}><GrInstagram className={`text-4xl text-white mx-4 transition duration-500 hover:scale-110`}/></a>
                        <a href={`vk.com`}><SlSocialVkontakte className={`text-4xl text-white transition duration-500 hover:scale-110`}/></a>
                    </div>
                </div>
            </div>
        </>
    )
}

export default Footer