import React, { useState } from "react";
import { formProps } from "../../models/types";
import { Link } from "react-router-dom";

const Form = ({
    title,
    handleClick,
    underText,
    underText2,
    link,
    loginPage,
}: formProps) => {
    const [name, setName] = useState("");
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");

    return (
        <div className={`flex h-full w-full items-center justify-center`}>
            <img
                src="https://img.setka.io/clients/ERswQaPUWaeWgjb6hekcAkZGgz6Intd3/post_images/rednike-2022102719380146.jpg"
                className=" desktop:flex relative hidden h-screen w-full"
                alt="image"
            />

            <img
                src={`https://oboi.ringtonz.ru/uploads/posts/2020-04/1585991149_krossovki_nogi_obuv_podsvetka_116317_1440x2560.jpg`}
                alt={"image"}
                className={`desktop:hidden flex`}
            />

            <div
                className={`absolute flex flex-col items-center justify-center rounded-md
                        bg-white p-10`}
            >
                <h1 className={`mb-4 font-mono text-2xl font-bold`}>{title}</h1>

                <form className={`flex flex-col items-start justify-center`}>
                    <h1 className={`mb-2 font-mono text-sm`}>
                        Enter your name
                    </h1>
                    <input
                        type="name"
                        value={name}
                        onChange={(e) => setName(e.target.value)}
                        placeholder="Alex"
                        className={` w-[250px] rounded-md bg-gray-300 p-2 outline-none`}
                    />

                    <h1
                        className={`${
                            loginPage ? "hidden" : "flex"
                        } my-2 font-mono text-sm`}
                    >
                        Enter your email
                    </h1>
                    <input
                        type="email"
                        value={email}
                        onChange={(e) => setEmail(e.target.value)}
                        placeholder="example@gmail.com"
                        className={`${
                            loginPage ? "hidden" : "flex"
                        } w-[250px] rounded-md bg-gray-300 p-2 outline-none`}
                    />

                    <h1 className="my-2 font-mono text-sm">
                        Enter your password
                    </h1>
                    <input
                        type="password"
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                        placeholder="your password"
                        className={`w-[250px] rounded-md bg-gray-300 p-2 outline-none`}
                    />
                </form>

                <h1 className="text-md my-4 text-gray-500">
                    {underText}{" "}
                    <Link
                        to={`/${link}`}
                        className="text-md text-black hover:text-blue-400"
                    >
                        {underText2}
                    </Link>
                </h1>

                <button
                    onClick={() => handleClick(name, email, password)}
                    children={`${loginPage ? "Log in" : "Register"}`}
                    className={`w-[250px] rounded-md border-2 border-solid border-black bg-black p-2
            font-mono font-bold text-white transition duration-300 hover:bg-white hover:text-black`}
                />
            </div>
        </div>
    );
};

export default Form;
