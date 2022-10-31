import styled from "styled-components";
import {useState} from 'react';
import { useTranslation } from "react-i18next";
import {useRef} from 'react';
const Inputmy = ()=>{
  const {t} = useTranslation();
  const [message, setMessage] = useState('');
  const inputRef = useRef(null);
  const handleChange = event => {
    setMessage(event.target.value);

    console.log('value is:', event.target.value);
  };
  return(
<StyledInput  type="text"
        id="message" name="message" placeholder={t("EMAIL")} onChange={handleChange}
        value={message}  ref={inputRef}></StyledInput>);
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
export default Inputmy;