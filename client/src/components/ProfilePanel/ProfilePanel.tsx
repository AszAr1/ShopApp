import SettingsPanel from '../SettingsPanel/SettingsPanel';
import { UseUser } from '../../stores/UseUser';
import PhonePanelNavMenu from '../PhonePanelNavMenu/PhonePanelNavMenu';
import ChangeSecureDataForm from '../ChangeDataForm/ChangeDataForm';
import ChangeNameImgForm from '../ChangeImgForm/ChangeImgForm';

function ProfilePanel() {
    const user = UseUser((state) => state.user);

    return (
        <>
            <div className="flex laptop:flex-row flex-col justify-start items-start h-full w-full p-6">

                <SettingsPanel />
                <PhonePanelNavMenu />

                <div className="grid laptop:grid-cols-2 laptop:gap-3 w-full grid-cols-1 gap-4 p-2">

                    <div className="laptop:p-10 flex items-center justify-center rounded-md border-2 border-solid border-black p-2 shadow-xl">
                        <div className="flex flex-col items-center justify-center">
                            <div className="relative h-[200px] w-[200px] overflow-hidden rounded-full border-2 border-solid border-black">
                                <img
                                    className="absolute"
                                    src={`${user.image}`}
                                />
                            </div>
                            <h1 className="font-mono">Name: {user.username}</h1>
                            <h1 className="font-mono">Email: {user.email}</h1>
                        </div>
                    </div>        

                    <ChangeNameImgForm/>            

                    <div className="laptop:col-span-2 laptop:p-10 flex h-[400px] laptop:flex-row flex-col items-center justify-center rounded-md border-2 border-solid border-black p-2 shadow-xl">
                        
                        <ChangeSecureDataForm/>

                        <div className='p-3 border-2 mx-6 laptop:mt-0 mt-5 flex items-center justify-center text-4xl border-black rounded-md w-full h-full'>
                            (◕‿◕)
                        </div>
                    </div>

                </div>
            </div>
        </>
    );
}

export default ProfilePanel