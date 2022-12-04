import styled from "styled-components";
import {useState} from 'react';
import { useTranslation } from "react-i18next";
import axios from "axios";
import DropDownn from "./DropDown";
import Button from "./Button";
import { Navigate, Link } from "react-router-dom";
const ButtonContainer = styled.div`
  margin: 1rem 0 1rem 0;
  width: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
`;
const FormatMail = styled.span`
  width: 35%;
  cursor: pointer;
  text-transform: lowercase;
  font-size: 6px;
  letter-spacing: 0rem;
  `;
  
  const InputContainer = styled.div`
  margin: 0rem 0 1rem 0;  
  display:flex;
  align-items: left;
  width:80%;
`;

const LoginInputs = ()=>{
  let endpoint = "http://localhost:8080";
  const {t} = useTranslation();
  const [inpt, setMessage] = useState('');
  const [pssw, setpssw] = useState('');
 
  const handleChangeinpt = event => {
    setMessage(event.target.value);

    console.log('value is:', event.target.value);
  };
  const handleChangepsw = event => {
    setpssw(event.target.value);

    console.log('value is:', event.target.value);
  };
  function handleClick() {
    try {
       var xhttp = new XMLHttpRequest();
       xhttp.open("GET", "http://localhost:8080/log_student/"+inpt+"/"+pssw,false);
       xhttp.setRequestHeader("Content-type", "text/html");
       xhttp.send();
       var response = JSON.parse(xhttp.response);
      console.log(response);
    } catch (error) {
      alert("Kullanıcı adı veya şifre hatalı");
  }
  if(!response){
   setHomePage(false);
  }
  else{
    setHomePage(true);
  }
    
  };
  const [homePage, setHomePage] = useState(false);
  if(homePage){
    return <Navigate to="/Homepage/infoLecture" />;
  }
  return(
    <div>
      <ButtonContainer>
      <StyledInput  type="text"
        id="inpt" name="inpt" placeholder={t("EMAIL")} onChange={handleChangeinpt}
        value={inpt}  ></StyledInput>
      <FormatMail>
      <DropDownn placeholder={t("EXTENSION")}></DropDownn>
      </FormatMail>
    </ButtonContainer>
    <InputContainer>
    <StyledInputPassword  type="password"
        id="psw" name="psw" placeholder={t("PASSWORD")} onChange={handleChangepsw}
        value={pssw} ></StyledInputPassword>
    </InputContainer>
    <ButtonContainer>
      <Button  content={t("LOGIN_BTN") } onClick={handleClick}/>
    </ButtonContainer>
    </div>
        );
      
}
const StyledInputPassword = styled.input`
  background: rgba(255, 255, 255, 0.15);
  box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
  border-radius: 2rem;
  margin-left: 2.2rem;
  width: 100%;
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
export default LoginInputs;