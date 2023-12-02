import { FC } from "react";

interface INoItems {
    title: string
}

export const NoItems: FC<INoItems> = (props) => {
    return (
        <div className="flex h-screen w-full flex-col items-center justify-center">
            <h1 className="text-4xl font-bold">(◕‿◕)</h1>
            <h1 className="mt-8 font-mono text-4xl font-bold">
                Your {props.title} is empty now
            </h1>
        </div>
    )
}