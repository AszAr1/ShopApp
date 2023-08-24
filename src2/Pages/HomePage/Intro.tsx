import Button from "../../components/UI/Button";

function Intro() {
  return (
    <>
      <div className="w-full">
        <div className="w-full flex justify-center items-center overflow-hidden h-full">
          <img src='https://img.setka.io/clients/ERswQaPUWaeWgjb6hekcAkZGgz6Intd3/post_images/rednike-2022102719380146.jpg'
            className=" hidden sm:flex w-full h-screen relative" alt="image" />
          <img src={`https://oboi.ringtonz.ru/uploads/posts/2020-04/1585991149_krossovki_nogi_obuv_podsvetka_116317_1440x2560.jpg`} alt={"image"}
            className={`flex sm:hidden`} />
          {/* <video className="min-w-full min-h-screen absolute">
            <source src="./bgVideo.mp4" type="video/mp4" />
          </video> */}
          <div className="absolute flex justify-center items-center flex-col">
            <h1 className="text-white uppercase text-center text-5xl sm:text-6xl font-bold">Welcome to Sneakers</h1>
            <h1 className="text-white uppercase text-center text-3xl sm:text-6xl font-bold py-4 sm:py-10">You can show all you need</h1>
            <Button className="flex justify-center items-center p-2 sm:px-4 sm:py-2
                            bg-white text-black
                            transition duration-500 hover:scale-110
                            font-bold text-lg rounded-md
                        ">
              Show more
            </Button>
          </div>
        </div>
      </div>
    </>
  )
}

export default Intro
