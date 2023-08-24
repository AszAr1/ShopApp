import React from "react";
import {ButtonProps} from "../../models/types";

function Button ({className, children}:ButtonProps) {
    return (
        <>
            <button className={`${className}`}>
                {children}
            </button>
        </>
    )
}

export default Button