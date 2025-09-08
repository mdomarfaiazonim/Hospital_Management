import React from 'react'
import '../style/About.css';

export default function About() {
  const teamMembers = [
    { name: 'Dr. Jane Smith', specialty: 'Cardiology', image: 'path_to_image' },
    { name: 'Nurse John Doe', specialty: 'Pediatrics', image: 'path_to_image' },
    // Add more team members as needed
  ];

  const testimonials = [
    "The staff was incredible, and I felt well cared for during my visit.",
    "I received excellent service, and the doctors were very attentive.",
    // Add more testimonials as needed
  ];

  return (
    <div className="rout-container">

      <div className="about-us">
        <h1>About Us</h1>
        <section>
          <h2>Our Mission</h2>
          <p>Our mission is to provide compassionate, high-quality healthcare to our community.</p>
        </section>
        <section>
          <h2>Our Vision</h2>
          <p>To be the leading provider of integrated healthcare services in the region.</p>
        </section>
        <section>
          <h2>Meet Our Team</h2>
          <div className="team">
            {teamMembers.map((member, index) => (
              <div key={index} className="team-member">
                <img src={member.image} alt={member.name} />
                <h3>{member.name}</h3>
                <p>{member.specialty}</p>
              </div>
            ))}
          </div>
        </section>
        <section>
          <h2>Our History</h2>
          <p>Founded in 2010, we have grown to serve thousands of patients in our community...</p>
        </section>
        <section>
          <h2>Services Overview</h2>
          <ul>
            <li>Online Appointments</li>
            <li>Ambulance Services</li>
            <li>Medicine Store</li>
          </ul>
        </section>
        <section>
          <h2>Patient Testimonials</h2>
          <ul>
            {testimonials.map((testimonial, index) => (
              <li key={index}>"{testimonial}"</li>
            ))}
          </ul>
        </section>
        <section>
          <h2>Contact Us</h2>
          <p>Phone: (123) 456-7890</p>
          <p>Email: contact@healthcare.com</p>
        </section>
        <section>
          <h2>Get in Touch</h2>
          <p>Contact us today to learn more or schedule an appointment!</p>
        </section>
      </div>

    </div>
  );
}
