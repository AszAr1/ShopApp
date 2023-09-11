import React, {FC} from 'react'

interface ModalProps {
    children?: React.ReactNode
    isOpen: boolean
    openFunc: () => void
}
const Modal:FC<ModalProps> = (props) => {
    return (
        <div className={`${props.isOpen ? 'absolute' : 'hidden'} flex justify-center items-center w-full h-full`}>
            <div className={`z-10 flex flex-col justify-center items-center p-10 w-3/5 h-3/5 
                bg-white rounded-xl border-2 border-solid border-black
            `}>
                <h1 className={`font-mono text-2xl font-bold`}>
                    Set ur new image
                </h1>
                <button 
                    className={`bg-black p-3 text-white font-mono font-bold mt-4 rounded-md border-2 border-solid border-black
                        transition-all duration-300 hover:bg-white hover:text-black
                    `}
                >
                    Select image
                </button>
            </div>
            <button 
                className={`${props.isOpen ? 'absolute' : 'hidden'} z-1 flex justify-center items-center bg-black opacity-20 w-full h-full cursor-default`}
                onClick={props.openFunc}
            />
        </div>
    )
}

export default Modal