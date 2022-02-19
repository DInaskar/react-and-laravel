import React from 'react';
import './Login.scss';
import 'bootstrap/dist/css/bootstrap.css';
import { Form,Button,Image} from "react-bootstrap";
import logo from './undraw_remotely_2j6y.svg';
import avatar from './avatar.png';
import axios from "axios";
import { useState, useEffect } from 'react';
import swal from 'sweetalert';
import {useHistory} from "react-router-dom";



function Login() {
  const history=useHistory();
    const initialValues = { email: "", password: "" };
    const [formValues, setFormValues] = useState(initialValues);
    const [formErrors, setFormErrors] = useState({});
    const [isSubmit, setIsSubmit] = useState(false);
  
    const handleChange = (e) => {
      const { name, value } = e.target;
      setFormValues({ ...formValues, [name]: value });
    };
  
    const handleSubmit = (e) => {
      e.preventDefault();
      setFormErrors(validate(formValues));
      setIsSubmit(true);

      const data={
        email:formValues.email,
        password:formValues.password,
      }

      axios.get('sanctum/csrf-cookie').then(response => {
        axios.post(`api/login`,data).then(res=>{
            if(res.data.status===200){
                localStorage.setItem('auth_token',res.data.token);
                localStorage.setItem('auth_name',res.data.usernamess);
                localStorage.setItem('auth_email',res.data.email);
                localStorage.setItem("userpassword", response.data.password);
                swal("Success",res.data.message, "success");
                history.push('/UserDashboard');
               
            }
            else
            {
              history.push('/');
            }
        });
    
      });  

    };
  
    useEffect(() => {
      console.log(formErrors);
      if (Object.keys(formErrors).length === 0 && isSubmit) {
        console.log(formValues);
        
      }
    }, [formErrors]);
    const validate = (values) => {
      const errors = {};
      const regex = /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/i;

      if (!values.email) {
        errors.email = "Email is required!";
      } else if (!regex.test(values.email)) {
        errors.email = "This is not a valid email format!";
      }
      if (!values.password) {
        errors.password = "Password is required";
      } else if (values.password.length < 4) {
        errors.password = "Password must be more than 4 characters";
      } else if (values.password.length > 10) {
        errors.password = "Password cannot exceed more than 10 characters";
      }
      return errors;
    };



  return (
    <div className='main-login'>
          <div className="container">
      <div className="row">
      <div className="col-sm-6">
        <img className='login_image' src={logo} />
      </div>
         <div className="col-sm-4">
          <div >   
        <form onSubmit={handleSubmit}>
        <div className="row">
            <div className='container'>
              <img src={avatar} className="avatar"/>
            </div>
          </div>      
              <div className="container">
                <Form.Group className="mb-3">
                    <Form.Label className="formLabel">Enter Email Address</Form.Label>
                    <Form.Control type="email" name="email" placeholder="name@example.com"  value={formValues.email} onChange={handleChange} />
                    <p className='Errordisplay'>{formErrors.email}</p>
                </Form.Group>
                <Form.Group className="mb-3">
                  <Form.Label className="formLabel">Enter Password</Form.Label>
                      <Form.Control type="password" placeholder="Password" name="password" value={formValues.password} onChange={handleChange} />
                      <p className='Errordisplay'>{formErrors.password}</p>
                </Form.Group>
                <Form.Group className="mb-3">
                  <Button variant="success" type="submit">Login</Button>
                </Form.Group>
                <Form.Group className="mb-3">
                <Form.Label>Create an Account <a href="/Register" >Sign Up</a></Form.Label>
                </Form.Group>
              </div>
            </form>
            </div>
          </div>
          <div className="col-sm-2"></div>
      </div>
    </div>
    </div>
  );
}

export default Login;