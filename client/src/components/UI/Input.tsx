import React from "react";
import {InputProps} from "../../models/types";

function Input ({placeholder, InputClassName, className, ChildrenClassName, children}:InputProps) {
    return (
        <div className={`${className} flex justify-between items-center`}>
            <div className={`${ChildrenClassName}`}>{children}</div>
            <input className={`${InputClassName}`} placeholder={placeholder}></input>
        </div>
    )
}

export default Input