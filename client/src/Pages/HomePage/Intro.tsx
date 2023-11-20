import Button from "../../components/UI/Button";

function Intro() {
    return (
        <>
            <div className="w-full">
                <div className="flex h-full w-full items-center justify-center overflow-hidden">
                    <img
                        src="https://img.setka.io/clients/ERswQaPUWaeWgjb6hekcAkZGgz6Intd3/post_images/rednike-2022102719380146.jpg"
                        className="laptop:flex relative hidden h-screen w-full"
                        alt="image"
                    />
                    <img
                        src={`https://oboi.ringtonz.ru/uploads/posts/2020-04/1585991149_krossovki_nogi_obuv_podsvetka_116317_1440x2560.jpg`}
                        alt={"image"}
                        className={`laptop:hidden flex`}
                    />
                    <div className="absolute flex flex-col items-center justify-center">
                        <h1 className="desktop:text-6xl text-center text-5xl font-bold uppercase text-white">
                            Welcome to Sneakers
                        </h1>
                        <h1 className="desktop:text-6xl desktop:py-10 py-4 text-center text-3xl font-bold uppercase text-white">
                            You can show all you need
                        </h1>
                        <Button className="desktop:px-4 laptop:py-2 flex items-center justify-center rounded-md bg-white p-2 text-lg font-bold text-black transition duration-500 hover:scale-110 ">
                            Show more
                        </Button>
                    </div>
                </div>
            </div>
        </>
    );
}

export default Intro;
