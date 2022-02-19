import React from "react";
import { useState, useEffect } from 'react';
import { Form,Button} from "react-bootstrap";
import axios from "axios";
import swal from 'sweetalert';
import {useHistory} from "react-router-dom";

function UserDashboard() {
  const history=useHistory();
  const initialValues = { name: "", email: "", password: "",comformpass:"" };
  const [formValues, setFormValues] = useState(initialValues);
  const [formErrors, setFormErrors] = useState({});
  const [isSubmit, setIsSubmit] = useState(false);

  const auth_name= localStorage.getItem("auth_name");

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
            
      
          }
          else
          {
            swal("Danger","dfdfdfdf", "danger");
          }
      });
  
    });  

    /*const useremail = JSON.parse(localStorage.getItem("auth_email"));
    const userpassword= localStorage.getItem("userpassword");*/
    



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
       
      <div className="container">
          <div className="row">
            <div className="col-sm-6">
        <h3> HomePage</h3>
        <h5> Welcome, {auth_name.usernamess} </h5> You have Logged in
            successfully.


            <button className="btn-success" size="sm">Logout</button >
         
              </div>
            <div className="col-sm-4">
              <form onSubmit={handleSubmit}>        
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
                        <Button variant="success" type="submit">Update User Inforation</Button>
                      </Form.Group>
                    </div>
                  </form>
              </div>
          <div className="col-sm-2"></div>
      </div>
    </div>
  )     
}

export default UserDashboard;