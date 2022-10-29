import './index.css'


import MainContainer from "./components/MainContainer";
import SidebarButton from "./components/SidebarButton";
function App() {
  return (
    <body >
      <MainContainer style = {{alignItems: "center",  justifyContent: 'center'}}/>
      <SidebarButton />
      
    </body>
    
  );
}



export default App;