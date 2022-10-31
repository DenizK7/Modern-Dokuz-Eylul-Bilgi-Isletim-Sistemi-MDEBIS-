import styled from "styled-components";
import {useState} from 'react';
import { useTranslation } from "react-i18next";
import {useRef} from 'react';
import axios from "axios";
const Deneme = ()=>{
  let endpoint = "http://localhost:8080";
  const {t} = useTranslation();
  const [inpt, setMessage] = useState('');
  const [pssw, setpssw] = useState('');
  const inputRef = useRef(null);
  const passwRef = useRef(null);
  const handleChangeinpt = event => {
    setMessage(event.target.value);

    console.log('value is:', event.target.value);
  };
  const handleChangepsw = event => {
    setpssw(event.target.value);

    console.log('value is:', event.target.value);
  };
  function handleClick() {
    
    axios
    .put(endpoint +"/log_student/" + inpt+ "/"+pssw, {
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    })
    .then((res) => {
      console.log(res);
      this.getTask();
    });
  }
  
  return(
    <div>
<StyledInput  type="text"
        id="inpt" name="inpt" placeholder={t("EMAIL")} onChange={handleChangeinpt}
        value={inpt}  ref={inputRef}></StyledInput>

<StyledInput  type="password"
        id="psw" name="psw" placeholder={t("EMAIL")} onChange={handleChangepsw}
        value={pssw} ref={passwRef}></StyledInput>
        <button onClick={handleClick}>Log message</button>
    </div>

        
        );
      
}

const StyledInput = styled.input`
  background: rgba(255, 255, 255, 0.15);
  box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
  border-radius: 2rem;
  width: 45%;
  height: 3rem;
  padding: 1rem;
  border: none;
  outline: none;
  color: #3c354e;
  font-size: 1rem;
  font-weight: bold;
  &:focus {
    display: inline-block;
    box-shadow: 0 0 0 0.2rem #b9abe0;
    backdrop-filter: blur(12rem);
    border-radius: 2rem;
  }
  &::placeholder {
    font-weight: 100;
    font-size: 1rem;
  }
`;
export default Deneme;