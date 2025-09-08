import React, { useState, useRef, useEffect } from 'react';
import '../style/Auth.css';
import registerImage from '../Images/register.svg';
import { Link } from 'react-router-dom';
import axios from "axios";
import Box from '@mui/material/Box';
import TextField from '@mui/material/TextField';
import Button from '@mui/material/Button';
import Stack from '@mui/material/Stack';

function Auth() {

  const loginBtnRef = useRef();
  const signupBtnRef = useRef();
  const authContainerRef = useRef();

  const [userid, setUserid] = useState('29');
  const [username, setUsername] = useState('');
  const [email, setEmail] = useState('');
  const [phone, setPhone] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');

  const [_userid, setUserid2] = useState('29');
  const [_username, setUsername2] = useState('');
    const [_email, setEmail2] = useState('');
    const [_phone, setPhone2] = useState('');
    const [_password, setPassword2] = useState('');
    const [_confirmPassword, setConfirmPassword2] = useState('');

  const [isSignupMode, setIsSignupMode] = useState(false);
  const [inputType, setInputType] = useState('text');

  const goToSignUp = () => {
    if (authContainerRef.current) {
      authContainerRef.current.classList.add('sign-up-mode');
    }
    setIsSignupMode(true);
  };

  const goToLogin = () => {
    if (authContainerRef.current) {
      authContainerRef.current.classList.remove('sign-up-mode');
    }
    setIsSignupMode(false);
  };

  const IsEmailExist  = async (e) =>{
  e.preventDefault();
     try {
         const response =await axios.get("http://localhost:8080/user/get/${_email}");

         const uu=response.data;
         console.log("Here is the print"+uu);
         if(response.data!=null){
             alert('Yes you can log in');
         }else alert('No that provided email does not exist');
      }catch (error) {
             console.error("Error finding user:", error);
     }
  };

  const SignUpPageSubmission = async (e) =>{
          e.preventDefault();

          if(password===confirmPassword){
            console.log(username,email,phone,password,confirmPassword);

            try {
               const response =await axios.post("http://localhost:8080/user/add", {
                  user_id: userid,
                  user_contact: phone,
                  user_email: email,
                  user_password: password,
                  user_name: username
               });

               console.log(response.data);
            } catch (error) {
               console.error("Error adding user:", error);
            }

            alert("Your account is created on this email "+email);
          }
          else{
            alert("Password and Confirm Password does not match");
          }
  }

  return (
    <div className="rout-container">

      <div className="auth-container" ref={authContainerRef}>
        <div className="forms-container">
          <div className="signin-signup">
            <form className="sign-in-form">
              <h2 className="auth-title">Log In</h2>
              <div className="auth-input-container">
                <input type="email" className="auth-input-field" placeholder="Email" id="login-email"
                onChange={(e) => {
                                  setEmail2(e.target.value);
                                }}
                />
                <label htmlFor="login-email" className="auth-input-label">Email</label>
                <i className="input-icon fa fa-envelope"></i>
              </div>

              <div className="auth-input-container">
                <input type="password" className="auth-input-field" placeholder="Password" id="login-password"
                onChange={(e) => {
                                  setPassword2(e.target.value);

                                }}
                />
                <label htmlFor="login-password" className="auth-input-label">Password</label>
                <i className="input-icon fa fa-lock"></i>
              </div>
              <button className="btn transparent" onClick={IsEmailExist}
                            >Sign In</button>
              <Link to="/forgotpassword">Forgot Password?</Link>
            </form>












            <form className="sign-up-form">
              <h2 className="auth-title">Sign Up</h2>

              <div className="auth-input-container">
                <input
                type="text"
                className="auth-input-field"
                placeholder="User name"
                id="name"
                onChange={
                (e) => setUsername(e.target.value)
                }
                />
                <label htmlFor="name" className="auth-input-label">User name</label>
                <i className="input-icon fa fa-user"></i>
              </div>

              <div className="auth-input-container">
                <input type="email" className="auth-input-field" placeholder="Email" id="signup-email"
                onChange={(e) => {
                  setEmail(e.target.value);

                }}
                 />
                <label htmlFor="signup-email" className="auth-input-label">Email</label>
                <i className="input-icon fa fa-envelope"></i>
              </div>

              <div className="auth-input-container">
                <input type="number" className="auth-input-field" placeholder="Phone Number" id="phone"
                onChange={(e) => setPhone(e.target.value)}
                />
                <label htmlFor="phone" className="auth-input-label">Phone Number</label>
                <i className="input-icon fa-solid fa-phone-flip"></i>
              </div>

              <div className="auth-input-container">
                <input type="password" className="auth-input-field" placeholder="Password" id="signup-password"
                onChange={(e) => setPassword(e.target.value)}
                />
                <label htmlFor="signup-password" className="auth-input-label">Password</label>
                <i className="input-icon fa fa-lock"></i>
              </div>

              <div className="auth-input-container">
                <input type="password" className="auth-input-field" placeholder="Confirm Password" id="confirm-password"
                 onChange={(e) => setConfirmPassword(e.target.value)}
                 />
                <label htmlFor="confirm-password" className="auth-input-label">Confirm Password</label>
                <i className="input-icon fa-solid fa-square-check"></i>
              </div>
              <button className="btn transparent" onClick={SignUpPageSubmission}
              >Sign Up</button>
            </form>
          </div>
        </div>









        <div className="panels-container">
          <div className="panel left-panel">
            <div className="auth-content">
              <h3>New here?</h3>
              <p>Sign up to get started with our awesome platform.</p>
              <button className="btn transparent" id="sign-up-btn" ref={signupBtnRef} onClick={goToSignUp}>
                Sign Up
              </button>
            </div>
            <img src={registerImage} className="image" alt="Log In Illustration" />
          </div>


          <div className="panel right-panel">
            <div className="auth-content">
              <h3>One of us?</h3>
              <p>If you already have an account, Log in here.</p>
              <button className="btn transparent" id="sign-in-btn" ref={loginBtnRef} onClick={goToLogin}>
                Log In
              </button>
            </div>
            <img src={registerImage} className="image" alt="Sign Up Illustration" />
          </div>
        </div>
      </div>

    </div>
  );
}

export default Auth;
