function HomeIntro() {
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
                        <h1 className="laptop:text-6xl text-center text-5xl font-bold uppercase text-white">
                            Welcome to Sneakers
                        </h1>
                        <h1 className="laptop:text-6xl laptop:py-10 py-4 text-center text-3xl font-bold uppercase text-white">
                            You can show all you need
                        </h1>
                    </div>
                </div>
            </div>
        </>
    )
}

export default HomeIntro