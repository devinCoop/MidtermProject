<!DOCTYPE html>
<html>
  <title>To Good People</title>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="css/styles.css" />
  <link rel="stylesheet" href="css/wow.css" />
  <link
    rel="stylesheet"
    href="https://fonts.googleapis.com/css?family=Raleway"
  />
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
  />

  <body>
    <!-- Navbar (sit on top) -->
    <div class="w3-top">
      <div class="w3-bar w3-white w3-card w3-text-deep-purple" id="myNavbar">
        <a href="#home" class="w3-bar-item w3-button w3-wide">QUARANGEL</a>
        <!-- Right-sided navbar links -->
        <div class="w3-right w3-hide-small">
          <button
            onclick="document.getElementById('id01').style.display='block'"
            class="w3-bar-item w3-button"
          >
            REGISTER
          </button>

          <div id="id01" class="w3-modal">
            <div
              class="w3-modal-content w3-card-4 w3-animate-zoom"
              style="max-width: 600px"
            >
              <div class="w3-center">
                <br />
                <span
                  onclick="document.getElementById('id01').style.display='none'"
                  class="w3-button w3-xlarge w3-white w3-display-topright"
                  title="Close Modal"
                  >x</span
                >
                <img
                  src="img/profilePicDefault.png"
                  alt="Avatar"
                  style="width: 30%"
                  class="w3-circle w3-margin-top"
                />
              </div>

              <form class="w3-container" action="registration.do" method="POST">
                <div class="w3-section">
                  <label><b>Username</b></label>
                  <input
                    class="w3-input w3-border"
                    type="text"
                    placeholder="Enter Username"
                    name="username"
                    required
                  />
                  <label><b>Password</b></label>
                  <input
                    class="w3-input w3-border"
                    type="text"
                    placeholder="Enter Password"
                    name="password"
                    required
                  />
                  <label><b>Email</b></label>
                  <input
                    class="w3-input w3-border"
                    type="text"
                    placeholder="Enter Email"
                    name="email"
                    required
                  />
                  <label><b>First Name</b></label>
                  <input
                    class="w3-input w3-border"
                    type="text"
                    placeholder="Enter First Name"
                    name="firstName"
                    required
                  />
                  <label><b>Last Name</b></label>
                  <input
                    class="w3-input w3-border"
                    type="text"
                    placeholder="Enter Last Name"
                    name="lastName"
                    required
                  />

                  <label><b>Phone</b></label>
                  <input
                    class="w3-input w3-border"
                    type="text"
                    placeholder="Enter (555)555-5555"
                    name="phone"
                    required
                  />
	             <label><b>Street</b></label>
                  <input
                    class="w3-input w3-border"
                    type="text"
                    placeholder="Enter Street"
                    name="street"
                    required
                  />
                  <label><b>City</b></label>
                  <input
                    class="w3-input w3-border"
                    type="text"
                    placeholder="Enter City"
                    name="city"
                    required
                  />
                  <label><b>State</b></label>
                  <input
                    class="w3-input w3-border"
                    type="text"
                    placeholder="Enter State"
                    name="state"
                    required
                  />
                  <label><b>Zip</b></label>
                  <input
                    class="w3-input w3-border"
                    type="text"
                    placeholder="Enter Zip"
                    name="zipCode"
                    required
                  />

                  <button
                    class="w3-button w3-block w3-green w3-section w3-padding"
                    type="submit"
                  >
                    Register
                  </button>
                </div>
              </form>
            </div>
          </div>
          <!-- End pop up modal for Register -->
          <!-- Begin pop up modal for Login  -->
          <button
            onclick="document.getElementById('id02').style.display='block'"
            class="w3-bar-item w3-button"
          >
            LOGIN
          </button>
          <div id="id02" class="w3-modal">
            <div
              class="w3-modal-content w3-card-4 w3-animate-zoom"
              style="max-width: 600px"
            >
              <div class="w3-center">
                <br />
                <span
                  onclick="document.getElementById('id02').style.display='none'"
                  class="w3-button w3-xlarge w3-white w3-display-topright"
                  title="Close Modal"
                  >x</span
                >
                <img
                  src="img/profilePicDefault.png"
                  alt="Avatar"
                  style="width: 30%"
                  class="w3-circle w3-margin-top"
                />
              </div>

              <form class="w3-container" action="login.do" method = "POST">
                <div class="w3-section">
                  <label><b>Username</b></label>
                  <input
                    class="w3-input w3-border w3-margin-bottom"
                    type="text"
                    placeholder="Enter Username"
                    name="username"
                    required
                  />
                  <label><b>Password</b></label>
                  <input
                    class="w3-input w3-border"
                    type="text"
                    placeholder="Enter Password"
                    name="password"
                    required
                  />
                  <button
                    class="w3-button w3-block w3-green w3-section w3-padding"
                    type="submit"
                  >
                    Login
                  </button>
                </div>
              </form>

              <div
                class="w3-container w3-border-top w3-padding-16 w3-light-grey"
              >
                <button
                  onclick="document.getElementById('id02').style.display='none'"
                  type="button"
                  class="w3-button w3-red"
                >
                  Cancel
                </button>
                <span class="w3-right w3-padding w3-hide-small"
                  >Forgot <a href="#">password?</a></span
                >
              </div>
            </div>
          </div>
          <!-- End pop up modal for Login -->
          <!--  <a href="#about" class="w3-bar-item w3-button">ABOUT</a>
      <a href="#team" class="w3-bar-item w3-button"><i class="fa fa-user"></i> TEAM</a> -->
          <!-- <a href="#work" class="w3-bar-item w3-button"><i class="fa fa-th"></i> WORK</a> -->
          <!-- <a href="#pricing" class="w3-bar-item w3-button"><i class="fa fa-usd"></i> PRICING</a> -->
          <!-- <a href="#contact" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i> CONTACT</a> -->
        </div>
        <!-- Hide right-floated links on small screens and replace them with a menu icon -->

        <a
          href="javascript:void(0)"
          class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium"
          onclick="w3_open()"
        >
          <i class="fa fa-bars"></i>
        </a>
      </div>
    </div>

    <!-- Sidebar on small screens when clicking the menu icon -->
    <nav
      class="w3-sidebar w3-bar-block w3-black w3-card w3-animate-left w3-hide-medium w3-hide-large"
      style="display: none"
      id="mySidebar"
    >
      <a
        href="javascript:void(0)"
        onclick="w3_close()"
        class="w3-bar-item w3-button w3-large w3-padding-16"
        >Close</a
      >
             <button
            onclick="document.getElementById('id03').style.display='block'"
            class="w3-bar-item w3-button"
          >
            REGISTER
          </button>

          <div id="id01" class="w3-modal">
            <div
              class="w3-modal-content w3-card-4 w3-animate-zoom"
              style="max-width: 600px"
            >
              <div class="w3-center">
                <br />
                <span
                  onclick="document.getElementById('id03').style.display='none'"
                  class="w3-button w3-xlarge w3-white w3-display-topright"
                  title="Close Modal"
                  >x</span
                >
                <img
                  src="img/profilePicDefault.png"
                  alt="Avatar"
                  style="width: 30%"
                  class="w3-circle w3-margin-top"
                />
              </div>

              <form class="w3-container" action="registration.do">
                <div class="w3-section">
                  <label><b>Username</b></label>
                  <input
                    class="w3-input w3-border"
                    type="text"
                    placeholder="Enter Username"
                    name="username"
                    required
                  />
                  <label><b>Password</b></label>
                  <input
                    class="w3-input w3-border"
                    type="text"
                    placeholder="Enter Password"
                    name="password"
                    required
                  />
                  <label><b>Email</b></label>
                  <input
                    class="w3-input w3-border"
                    type="text"
                    placeholder="Enter Email"
                    name="email"
                    required
                  />
                  <label><b>First Name</b></label>
                  <input
                    class="w3-input w3-border"
                    type="text"
                    placeholder="Enter First Name"
                    name="firstName"
                    required
                  />
                  <label><b>Last Name</b></label>
                  <input
                    class="w3-input w3-border"
                    type="text"
                    placeholder="Enter Last Name"
                    name="lastName"
                    required
                  />

                  <label><b>Phone</b></label>
                  <input
                    class="w3-input w3-border"
                    type="text"
                    placeholder="Enter (555)555-5555"
                    name="phone"
                    required
                  />
                  <label><b>Street</b></label>
                  <input
                    class="w3-input w3-border"
                    type="text"
                    placeholder="Enter Street"
                    name="street"
                    required
                  />
                  <label><b>City</b></label>
                  <input
                    class="w3-input w3-border"
                    type="text"
                    placeholder="Enter City"
                    name="city"
                    required
                  />
                  <label><b>State</b></label>
                  <input
                    class="w3-input w3-border"
                    type="text"
                    placeholder="Enter State"
                    name="state"
                    required
                  />
                  <label><b>Zip</b></label>
                  <input
                    class="w3-input w3-border"
                    type="text"
                    placeholder="Enter Zip"
                    name="zipCode"
                    required
                  />

                  <button
                    class="w3-button w3-block w3-green w3-section w3-padding"
                    type="submit"
                  >
                    Register
                  </button>
                </div>
              </form>
            </div>
          </div>
       <button
            onclick="document.getElementById('id04').style.display='block'"
            class="w3-bar-item w3-button"
          >
            LOGIN
          </button>
          <div id="id02" class="w3-modal">
            <div
              class="w3-modal-content w3-card-4 w3-animate-zoom"
              style="max-width: 600px"
            >
              <div class="w3-center">
                <br />
                <span
                  onclick="document.getElementById('id04').style.display='none'"
                  class="w3-button w3-xlarge w3-white w3-display-topright"
                  title="Close Modal"
                  >x</span
                >
                <img
                  src="img/profilePicDefault.png"
                  alt="Avatar"
                  style="width: 30%"
                  class="w3-circle w3-margin-top"
                />
              </div>

              <form class="w3-container" action="login.do">
                <div class="w3-section">
                  <label><b>Username</b></label>
                  <input
                    class="w3-input w3-border w3-margin-bottom"
                    type="text"
                    placeholder="Enter Username"
                    name="username"
                    required
                  />
                  <label><b>Password</b></label>
                  <input
                    class="w3-input w3-border"
                    type="text"
                    placeholder="Enter Password"
                    name="password"
                    required
                  />
                  <button
                    class="w3-button w3-block w3-green w3-section w3-padding"
                    type="submit"
                  >
                    Login
                  </button>
                </div>
              </form>

              <div
                class="w3-container w3-border-top w3-padding-16 w3-light-grey"
              >
                <button
                  onclick="document.getElementById('id04').style.display='none'"
                  type="button"
                  class="w3-button w3-red"
                >
                  Cancel
                </button>
                <span class="w3-right w3-padding w3-hide-small"
                  >Forgot <a href="#">password?</a></span
                >
              </div>
            </div>
          </div>
      <!-- <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button">ABOUT</a>
  <a href="#team" onclick="w3_close()" class="w3-bar-item w3-button">TEAM</a>
  <a href="#work" onclick="w3_close()" class="w3-bar-item w3-button">WORK</a>
  <a href="#pricing" onclick="w3_close()" class="w3-bar-item w3-button">PRICING</a>
  <a href="#contact" onclick="w3_close()" class="w3-bar-item w3-button">CONTACT</a> -->
    </nav>

    <!-- Header with full-height image -->
    <header class="bgimg-1 w3-display-container w3-grayscale-min" id="home">
      <div class="w3-display-right w3-text-black" style="padding: 48px">
  <!--       <span class="custom-hero w3-xlarge w3-hide-small"
          >Covid-19 has hit the world at a very unexpected time.<br/> Are you
          quarantined and may benefit from receiving help with small tasks? <br/>Are
          you quarantined and would much rather volunteer your time to help
          others during this time? </span
        ><br /> -->
        <!-- <p>
          <a
            href="#about"
            class="w3-button w3-white w3-padding-large w3-large w3-margin-top w3-opacity w3-hover-opacity-off"
            >Learn more and start today</a
          >
        </p> -->
      </div>
    </header>

    <!-- Promo Section "Statistics" -->
    <div class="w3-container w3-row w3-center w3-dark-grey w3-padding-64">
      <div class="w3-eighth">
        <span class="w3-col">Chores</span> 
      </div>
      <div class="w3-quarter">
        <span class="w3-col">Rides</span>
      </div>
      <div class="w3-quarter">
        <span class="w3-col">Delivery</span> 
      </div>
      <div class="w3-quarter">
        <span class="w3-col">Monetary</span> 
      </div>
      <div class="w3-quarter">
        <span class="w3-col">Handyman</span> 
      </div>
      <div class="w3-quarter">
        <span class="w3-col">Pet Walking</span> 
      </div>
      <div class="w3-quarter">
        <span class="w3-col">Other</span> 
      </div>
    </div>

    <!-- Team Section -->
    <div class="w3-container" style="padding: 128px 16px" id="team">
      <h3 class="w3-center">THE TEAM</h3>
      <p class="w3-center w3-large">The ones who runs this company</p>
      <div class="w3-row-padding w3-grayscale" style="margin-top: 64px">
        <div class="w3-col l3 m6 w3-margin-bottom">
          <div class="w3-card">
            <img src="/w3images/team2.jpg" alt="John" style="width: 100%" />
            <div class="w3-container">
              <h3>Janice Ellsworth</h3>
              <p class="w3-opacity">Scrum Master, Co-Developer</p>
              <p>
                Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse
                sodales pellentesque elementum.
              </p>
              <p>
                <button class="w3-button w3-light-grey w3-block">
                  <i class="fa fa-envelope"></i> Contact
                </button>
              </p>
            </div>
          </div>
        </div>
        <div class="w3-col l3 m6 w3-margin-bottom">
          <div class="w3-card">
            <img src="/w3images/team1.jpg" alt="Jane" style="width: 100%" />
            <div class="w3-container">
              <h3>Seth Schneider</h3>
              <p class="w3-opacity">Database Administrator, Co-Developer</p>
              <p>
                Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse
                sodales pellentesque elementum.
              </p>
              <p>
                <button class="w3-button w3-light-grey w3-block">
                  <i class="fa fa-envelope"></i> Contact
                </button>
              </p>
            </div>
          </div>
        </div>
        <div class="w3-col l3 m6 w3-margin-bottom">
          <div class="w3-card">
            <img src="/w3images/team3.jpg" alt="Mike" style="width: 100%" />
            <div class="w3-container">
              <h3>Devin Cooper</h3>
              <p class="w3-opacity">Front-End Design, Co-Developer</p>
              <p>
                Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse
                sodales pellentesque elementum.
              </p>
              <p>
                <button class="w3-button w3-light-grey w3-block">
                  <i class="fa fa-envelope"></i> Contact
                </button>
              </p>
            </div>
          </div>
        </div>
        <div class="w3-col l3 m6 w3-margin-bottom">
          <div class="w3-card">
            <img src="/w3images/team3.jpg" alt="Mike" style="width: 100%" />
            <div class="w3-container">
              <h3>Jon & Pablo Ellsworth</h3>
              <p class="w3-opacity">Chef Extraordinaire & Spiritual Advisor</p>
              <p>
                Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse
                sodales pellentesque elementum.
              </p>
              <p>
                <button class="w3-button w3-light-grey w3-block">
                  <i class="fa fa-envelope"></i> Contact
                </button>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Contact Section -->
    <div
      class="w3-container w3-light-grey"
      style="padding: 128px 16px"
      id="contact"
    >
      <h3 class="w3-center">CONTACT</h3>
      <p class="w3-center w3-large">Lets get in touch. Send us a message:</p>
      <div style="margin-top: 48px">
        <p>
          <i class="fa fa-map-marker fa-fw w3-xxlarge w3-margin-right"></i>
          Colorado, US
        </p>
        <p>
          <i class="fa fa-phone fa-fw w3-xxlarge w3-margin-right"></i> Phone:
          1-800-Sir-Mix-Alot
        </p>
        <p>
          <i class="fa fa-envelope fa-fw w3-xxlarge w3-margin-right"> </i>
          Email: mail@mail.com
        </p>
        <br />
        <form action="/action_page.php" target="_blank">
          <p>
            <input
              class="w3-input w3-border"
              type="text"
              placeholder="Name"
              required
              name="Name"
            />
          </p>
          <p>
            <input
              class="w3-input w3-border"
              type="text"
              placeholder="Email"
              required
              name="Email"
            />
          </p>
          <p>
            <input
              class="w3-input w3-border"
              type="text"
              placeholder="Subject"
              required
              name="Subject"
            />
          </p>
          <p>
            <input
              class="w3-input w3-border"
              type="text"
              placeholder="Message"
              required
              name="Message"
            />
          </p>
          <p>
            <button class="w3-button w3-black" type="submit">
              <i class="fa fa-paper-plane"></i> SEND MESSAGE
            </button>
          </p>
        </form>
        <!-- Image of location/map -->
        <img
          src="/w3images/map.jpg"
          class="w3-image w3-greyscale"
          style="width: 100%; margin-top: 48px"
        />
      </div>
    </div>

    <!-- Footer -->
    <footer class="w3-center w3-deep-purple w3-padding-64">
      <a href="#home" class="w3-button w3-light-grey"
        ><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a
      >

      <p>Powered by Goat Chaos</p>
    </footer>

    <script>
      // Modal Image Gallery
      function onClick(element) {
        document.getElementById("img01").src = element.src;
        document.getElementById("modal01").style.display = "block";
        var captionText = document.getElementById("caption");
        captionText.innerHTML = element.alt;
      }
      // Toggle between showing and hiding the sidebar when clicking the menu icon
      var mySidebar = document.getElementById("mySidebar");
      function w3_open() {
        if (mySidebar.style.display === "block") {
          mySidebar.style.display = "none";
        } else {
          mySidebar.style.display = "block";
        }
      }
      // Close the sidebar with the close button
      function w3_close() {
        mySidebar.style.display = "none";
      }
    </script>
  </body>
</html>