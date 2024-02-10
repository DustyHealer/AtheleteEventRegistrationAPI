using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AthleteEventAPI.Exceptions;
using AthleteEventAPI.Models;
using AthleteEventAPI.Service;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace AthleteEventAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]    
    public class AthleteEventController : ControllerBase
    {
        private readonly IAthleteEventService service;
        public AthleteEventController(IAthleteEventService _service)
        {
            service = _service;
        }

        [HttpPost("AthleteEvent/register")]
        [Authorize(Roles = "User,Admin")]
        public IActionResult Register(AthleteEvent athleteEvent) 
        {
            try
            {
                return Ok(service.Register(athleteEvent));
            }
            catch (AthleteEventNotFoundException e)
            {
                return NotFound(e.Message);
            }
            catch (Exception e) 
            {
                return BadRequest(e.Message);
            }
        }

        [HttpPost("inventory/add")]
        [Authorize(Roles = "Admin")]
        public IActionResult Add(AthleteEvent athleteEvent) 
        {
            try
            {
                return Ok(service.Add(athleteEvent));
            }
            catch (AthleteEventAlreadyExistsException e)
            {
                return Conflict(e.Message);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpGet("allAthleteEvents")]
        [Authorize(Roles = "User,Admin")]
        public IActionResult AllAthleteEvents() 
        {
            try
            {
                return Ok(service.AllAthleteEvents());
            }            
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpGet("search/{name}")]
        [Authorize(Roles = "User,Admin")]
        public IActionResult Search(string name) 
        {
            try
            {
                return Ok(service.Search(name));
            }
            catch (AthleteEventNotFoundException e)
            {
                return NotFound(e.Message);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpDelete("deleteAthleteEventByName/{name}")]
        [Authorize(Roles = "Admin")]
        public IActionResult DeleteAthleteEventByName(string name) 
        {
            try
            {
                return Ok(service.DeleteAthleteEventByName(name));
            }
            catch (AthleteEventNotFoundException e)
            {
                return NotFound(e.Message);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [HttpPut("blockAthleteEvent/{name}")]
        [Authorize(Roles = "Admin")]
        public IActionResult BlockAthleteEvent(string name) 
        {
            try
            {
                return Ok(service.BlockAthleteEvent(name));
            }
            catch (AthleteEventNotFoundException e)
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
