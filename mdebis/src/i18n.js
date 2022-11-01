import i18n from 'i18next';
import { initReactI18next } from 'react-i18next';
import LanguageDetector from 'i18next-browser-languagedetector';
// don't want to use this?
// have a look at the Quick start guide 
// for passing in lng and translations on init

i18n
 
  .use(LanguageDetector)
  // pass the i18n instance to react-i18next.
  .use(initReactI18next)
  // init i18next
  // for all options read: https://www.i18next.com/overview/configuration-options
  .init({
    fallbackLng: 'en',
    debug: true,

    resources: {
        en: {
            translation: {
                RESET: "reset",
                WELCOME: "welcome",
                EMAIL: "Email",
                PASSWORD: "Password",
                EXTENSION: "Extension",
                LOGIN_BTN: "Log in",
                UNDER_BTN_TXT: "Issues with login?",
                FORGT_PSSW: "Forget password?"
            }
        },
        tr: {
            translation: {
                RESET: "sıfırla",
                WELCOME: "hoşgeldiniz",
                EMAIL: "Email",
                PASSWORD: "şifre",
                EXTENSION: "uzantı",
                LOGIN_BTN: "giriş",
                UNDER_BTN_TXT: "Girişte bir sorun mu yaşıyorsun?",
                FORGT_PSSW: "şifreni mi unuttun"
            }
        }
    }
  });


export default i18n;