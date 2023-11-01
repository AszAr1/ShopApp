import React from "react";
import {InputProps} from "../../models/types";
import {BiSearchAlt} from 'react-icons/bi'

function Input ({placeholder, InputClassName, className, ChildrenClassName, children}:InputProps) {
    return (
        <div className="flex justify-between items-center">
            <BiSearchAlt/>
            <input className={`${InputClassName}`} placeholder={placeholder}></input>
        </div>
    )
}

export default Input