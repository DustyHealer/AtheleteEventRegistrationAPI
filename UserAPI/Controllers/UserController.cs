using System;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using UserAPI.Exceptions;
using UserAPI.Models;
using UserAPI.Service;

namespace UserAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserService service;
        private readonly ITokenGeneratorService tokenService;
        public UserController(IUserService _service, ITokenGeneratorService _tokenService)
        {
            service = _service;
            tokenService = _tokenService;
        }

        [HttpPost("register")]
        public IActionResult Register(User user) 
        {
            try
            {                
                return Ok(service.Register(user));
            }
            catch (UserAlreadyExistsException e)
            {
                return Conflict(e.Message);
            }
            catch (PasswordAndConfirmPasswordMismatchException e) 
            {
                return BadRequest(e.Message);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpPost("login")]
        public IActionResult Login(User user) 
        {
            try
            {
                var usr = service.Login(user);
                return Ok(tokenService.GenerateJWTToken(usr.Username, usr.Role));                
            }
            catch (UserNotFoundException e)
            {
                return NotFound(e.Message);
            }
            catch (UserIdBlockedException e) 
            {
                return BadRequest(e.Message);
            }
            catch (InvalidCredentialsException e)
            {
                return StatusCode(401, e.Message);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpGet("getAllUsers")]
        [Authorize(Roles = "User,Admin")]
        public IActionResult GetAllUsers() 
        {
            try
            {
                return Ok(service.GetAllUsers());
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpGet("getUserById/{id}")]
        [Authorize(Roles = "User,Admin")]
        public IActionResult GetUserById(int id)
        {
            try
            {
                return Ok(service.GetUserById(id));
            }
            catch (UserNotFoundException e)
            {
                return NotFound(e.Message);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpPut("updateUserPassword")]
        [Authorize(Roles = "User,Admin")]
        public IActionResult UpdateUserPassword(User user)
        {
            try
            {                
                return Ok(service.UpdateUserPassword(user));
            }
            catch (UserNotFoundException e)
            {
                return NotFound(e.Message);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpPut("updateUser/{id}")]
        [Authorize(Roles = "User,Admin")]
        public IActionResult UpdateUser(int id, User user)
        {
            try
            {                
                return Ok(service.UpdateUser(id, user));
            }
            catch (UserNotFoundException e)
            {
                return NotFound(e.Message);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpPut("blockUserById/{id}/{status}")]
        [Authorize(Roles = "Admin")]
        public IActionResult BlockUserById(int id, string status, User user)
        {
            try
            {                
                return Ok(service.BlockUserById(id, status));
            }
            catch (UserNotFoundException e)
            {
                return NotFound(e.Message);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

    }
}
