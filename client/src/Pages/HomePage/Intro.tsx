import Button from "../../components/UI/Button";

function Intro() {
  return (
    <>
      <div className="w-full">
        <div className="flex items-center justify-center w-full h-full overflow-hidden">
          <img src='https://img.setka.io/clients/ERswQaPUWaeWgjb6hekcAkZGgz6Intd3/post_images/rednike-2022102719380146.jpg'
            className="relative hidden w-full h-screen laptop:flex" alt="image" />
          <img src={`https://oboi.ringtonz.ru/uploads/posts/2020-04/1585991149_krossovki_nogi_obuv_podsvetka_116317_1440x2560.jpg`} alt={"image"}
            className={`flex laptop:hidden`} />
          {/* <video className="absolute min-w-full min-h-screen">
            <source src="./bgVideo.mp4" type="video/mp4" />
          </video> */}
          <div className="absolute flex flex-col items-center justify-center">
            <h1 className="text-5xl font-bold text-center text-white uppercase laptop:text-6xl">Welcome to Sneakers</h1>
            <h1 className="py-4 text-3xl font-bold text-center text-white uppercase laptop:text-6xl laptop:py-10">You can show all you need</h1>
            <Button className="flex items-center justify-center p-2 text-lg font-bold text-black transition duration-500 bg-white rounded-md laptop:px-4 laptop:py-2 hover:scale-110 ">
              Show more
            </Button>
          </div>
        </div>
      </div>
    </>
  )
}

export default Intro
