using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using BookingAPI.Exceptions;
using BookingAPI.Models;
using BookingAPI.Service;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace BookingAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(Roles = "User,Admin")]
    public class BookingController : ControllerBase
    {
        private readonly IBookingService service;
        public BookingController(IBookingService _service)
        {
            service = _service;
        }

        [HttpPost("Addbooking")]
        public IActionResult Addbooking(Booking booking) 
        {
            try
            {
                return Ok(service.AddBooking(booking));
            }
            catch (BookingAlreadyExistsException e) 
            {
                return Conflict(e.Message);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }


        [HttpGet("history/{email}")]
        public IActionResult History(string email) 
        {
            try
            {
                return Ok(service.History(email));
            }
            catch (BookingNotFoundException e)
            {
                return NotFound(e.Message);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }


        [HttpDelete("cancel/{id:int}")]
        public IActionResult Cancel(int id, Booking booking) 
        {
            try
            {
                return Ok(service.Cancel(id, booking));
            }
            catch (BookingNotFoundException e)
            {
                return NotFound(e.Message);
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }


        [HttpGet("getAllBookings")]
        public IActionResult GetAllBookings() 
        {
            try
            {
                return Ok(service.GetAllBookings());
            }            
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

    }
}
