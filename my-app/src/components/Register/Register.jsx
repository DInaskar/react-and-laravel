import React from "react";
import { useState, useEffect } from 'react';
import './Register.scss';
import { Form,Button} from "react-bootstrap";
import logo from './Register_image.svg';
import avatar from './avatar.png';
import axios from "axios";
import swal from 'sweetalert';
import {useHistory} from "react-router-dom";


function Register() {
  const history=useHistory();
  const initialValues = { name: "", email: "", password: "",comformpass:"" };
  const [formValues, setFormValues] = useState(initialValues);
  const [formErrors, setFormErrors] = useState({});
  const [isSubmit, setIsSubmit] = useState(false);

  const handleChange = (e) => {
    e.persist();
    const { name, value } = e.target;
    setFormValues({ ...formValues, [name]: value });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
    setFormErrors(validate(formValues));
     setIsSubmit(true);
  
      const data={
        name:formValues.name,
        email:formValues.email,
        password:formValues.password,
      }

      axios.get('sanctum/csrf-cookie').then(response => {
      axios.post(`api/register`,data).then(res=>{
          if(res.data.status===200){
              localStorage.setItem('auth_token',res.data.token);
              localStorage.setItem('auth_name',res.data.username);
              swal("Success",res.data.message, "success");
              history.push('/');
          }
          else
          {
            swal("Danger","dfdfdfdf", "danger");
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
    if (!values.name) {
      errors.name = "Username is required!";
    }
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
    if (!values.comformpass) {
      errors.comformpass = "Password is required";
    }else if (values.comformpass.length < 4) {
      errors.comformpass = "Password must be more than 4 characters";
    } else if (values.comformpass.length > 10) {
      errors.comformpass = "Password cannot exceed more than 10 characters";
    }
    else if (values.comformpass !== values.password) {
      errors.comformpass = "The Password is not maching";
    }
    return errors;


  };

  return (
    <div>
       <div className='main-login'>
          <div className="container">
      <div className="row">
      <div className="col-sm-6">
          <h1>Register User</h1> 
          <br/>
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
                <Form.Group className="mb-1">
                    <Form.Label className="formLabel">Enter Full Name</Form.Label>
                    <Form.Control type="text" name="name" placeholder="Username" value={formValues.name} onChange={handleChange} placeholder="Full Name" />
                    <p className='Errordisplay'>{formErrors.name}</p>
                </Form.Group>
                <Form.Group className="mb-1">
                    <Form.Label className="formLabel">Enter Email Address</Form.Label>
                    <Form.Control type="email"  name="email" value={formValues.email} onChange={handleChange}  placeholder="name@example.com" />
                    <p className='Errordisplay'>{formErrors.email}</p>
                </Form.Group>
                <Form.Group className="mb-1">
                  <Form.Label className="formLabel">Enter Password</Form.Label>
                      <Form.Control type="password" name="password"   value={formValues.password} onChange={handleChange} placeholder="Password" />
                      <p className='Errordisplay'>{formErrors.password}</p>
                </Form.Group>
                <Form.Group className="mb-1">
                  <Form.Label className="formLabel">Confirm Password</Form.Label>
                      <Form.Control type="password" name="comformpass" value={formValues.comformpass} onChange={handleChange} placeholder="Confirm Password" />
                      <p className='Errordisplay'>{formErrors.comformpass}</p>
                </Form.Group>
                <Form.Group className="mb-2">
                  <Button variant="success" type="submit">Submit</Button>
                </Form.Group>
                <Form.Group className="mb-2">
                <Form.Label> Already Registered? <a href="/" >Login</a></Form.Label>
                </Form.Group>
              </div>
            </form>
            </div>
          </div>
          <div className="col-sm-2"></div>
      </div>
    </div>
    </div>
    </div>
  );
}

export default Register;