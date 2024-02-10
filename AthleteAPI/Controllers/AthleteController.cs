using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AthleteAPI.Exceptions;
using AthleteAPI.Models;
using AthleteAPI.Service;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AthleteAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]    
    public class AthleteController : ControllerBase
    {
        private readonly IAthleteService service;
        public AthleteController(IAthleteService _service)
        {
            service = _service;
        }

        [HttpGet("getAllAthletes/{excludeLoggedInAthlete}")]
        [Authorize(Roles = "User,Admin")]
        public IActionResult GetAllAthletes(int excludeLoggedInAthlete) 
        {
            try
            {
                return Ok(service.GetAllAthletes(excludeLoggedInAthlete));
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpGet("getAllAthletes")]
        [Authorize(Roles = "User,Admin")]
        public IActionResult GetAllAthletes()
        {
            try
            {
                return Ok(service.GetAllAthletes());
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpGet("getAllUnblockedAthletes")]
        [Authorize(Roles = "Admin")]
        public IActionResult GetAllUnblockedAthletes()
        {
            try
            {
                return Ok(service.GetAllUnblockedAthletes());
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpGet("getAllCategories")]
        [Authorize(Roles = "User,Admin")]
        public IActionResult GetAllCategories()
        {
            try
            {
                return Ok(service.GetAllCategories());
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpGet("getAthleteById/{id:int}")]
        [Authorize(Roles = "User,Admin")]
        public IActionResult GetAthleteById(int id) 
        {
            try
            {
                return Ok(service.GetAthleteById(id));
            }
            catch (AthleteNotFoundException e) 
            {
                return NotFound(e.Message);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpGet("getAthleteByName/{name}")]
        [Authorize(Roles = "User,Admin")]
        public IActionResult GetAthleteByName(string name)
        {
            try
            {
                return Ok(service.GetAthleteByName(name));
            }
            catch (AthleteNotFoundException e)
            {
                return NotFound(e.Message);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpGet("getAthleteByCategory/{category}")]
        [Authorize(Roles = "User,Admin")]
        public IActionResult GetAthleteByCategory(string category)
        {
            try
            {
                return Ok(service.GetAthleteByCategory(category));
            }            
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpPost("addAthlete")]
        [Authorize(Roles = "Admin")]
        public IActionResult AddAthlete(Athlete athlete) 
        {
            try
            {
                
                return Ok(service.AddAthlete(athlete));
            }
            catch (AthleteAlreadyExistsException e)
            {
                return Conflict(e.Message);
            }
            catch (Exception e) 
            {
                return BadRequest(e.Message);
            }
        }

        [HttpPut("blockAthleteById/{id:int}/{status}")]
        [Authorize(Roles = "Admin")]
        public IActionResult BlockAthleteById(int id, string status) 
        {
            try
            {                
                return Ok(service.BlockAthleteById(id, status));
            }
            catch (AthleteNotFoundException e)
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
