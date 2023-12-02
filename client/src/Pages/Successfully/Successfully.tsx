import { useNavigate } from "react-router-dom"

export const Successfully = () => {

    const navigate = useNavigate()

    setTimeout(() => {
        navigate('/')
    }, 2000)

    return (
        <div className="flex justify-center items-center w-full h-screen">
            <h1 className="text-4xl font-bold">Thank you for your purchase:)</h1>
        </div>
    )
}