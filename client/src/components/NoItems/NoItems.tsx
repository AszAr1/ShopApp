function NoItems({title}: any) {
    return (
        <div className="flex h-screen p-14 w-full flex-col items-center justify-center">
            <h1 className="text-4xl font-bold">(◕‿◕)</h1>
            <h1 className="mt-8 font-mono text-4xl font-bold">
                Your {title} is empty now
            </h1>
        </div>
    )
}

export default NoItems