import React, { useState} from 'react';
import 'primeicons/primeicons.css';
import 'primereact/resources/themes/lara-light-indigo/theme.css';
import 'primereact/resources/primereact.css';
import { Dropdown } from 'primereact/dropdown';

const DropdownExtens = () => {
    const [selectedCity1, setSelectedCity1] = useState(null);
    let student = '@ogr.deu.edu.tr';
    let teacher = '@ogr.deu.edu.tr';
    const cities = [
        { name: student, code: 'student' },
        { name: teacher, code: 'teacher' }
    ];   
    const onCityChange = (e) => {
        setSelectedCity1(e.value);
    }
    const mystyle = {
      fontSize: "10px",
      fontFamily: "Arial",
      fontWeight: "200",
      width: "10vw"
    };
    
    return (
        <div className="dropdown">
            <div className="card">
                <Dropdown value={selectedCity1} options={cities} onChange={onCityChange} optionLabel="name" placeholder="Select a City"style={mystyle}/>                                
            </div>
        </div>
    );
}

export default DropdownExtens;