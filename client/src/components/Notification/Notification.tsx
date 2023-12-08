import { FC, useEffect, useState } from "react"
import { HiCheck, HiExclamation, HiX } from "react-icons/hi"

interface Props {
    negativeDescription?: string,
    positiveDescription?: string,
    setShowToast: (state: boolean) => void,
    done?: boolean
}

export const Notification:FC<Props> = ({negativeDescription, positiveDescription, setShowToast, done}) => {

    useEffect(() => {
      const timer = setTimeout(() => {
        setShowToast(false);
      }, 3000);
  
      return () => {clearTimeout(timer); setShowToast(false)}; 
    }, []); 
    return (
        <>
            <div className={`fixed z-20 top-20 laptop:w-1/5 w-56 flex justify-between items-center p-3
             bg-white rounded-md border-2 border-solid border-black`}>
                     <div 
                     className={`mr-4 inline-flex h-8 w-8 shrink-0 items-center justify-center rounded-lg 
                    ${done ? 'bg-green-100 text-green-500 dark:bg-green-800 dark:text-green-200'
                           : 'bg-orange-100 text-orange-500 dark:bg-orange-700 dark:text-orange-200'} `}
                     >
                       {done ?  <HiCheck className="h-5 w-5" /> :  <HiExclamation className="h-5 w-5" />}
                    </div>
                    <h1 className="text-red-400">{done ? positiveDescription : negativeDescription}</h1>
                    <HiX className="h-8 w-8 p-1 rounded-md duration-200 transition hover:bg-gray-300" onClick={() => setShowToast(false)}/>
            </div>
        </>
    )
}