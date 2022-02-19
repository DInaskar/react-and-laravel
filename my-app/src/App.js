import './App.css';
import { BrowserRouter as Router,Route,Switch} from "react-router-dom";
import Login from './components/Login/Login';
import 'bootstrap/dist/css/bootstrap.css';
import Register from './components/Register/Register';
import UserDashboard from './components/Admin/UserDashboard';
import axios from 'axios';

axios.defaults.baseURL="http://127.0.0.1:8000/";
axios.defaults.headers.post['Content-Type']='application/json';
axios.defaults.headers.post['Accept']='application/json';
axios.defaults.withCredentials = true;

function App() {
  return (
    <div className="App">
      <header className="App-header">
                <Router>
                  <Switch>
                    <Route path="/" exact>
                      <Login/>
                      
                    </Route>
                    <Route path="/Register">
                      <Register/>
                    
                    </Route>
                    <Route path="/UserDashboard">
                      <UserDashboard/>

                    </Route>
                  </Switch>
                </Router>
        </header>
     </div>
  );
}

export default App;
