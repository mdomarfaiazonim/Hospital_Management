// package com.Vital_Aid.Vital_Aid.Config;

// import org.springframework.context.annotation.Bean;
// import org.springframework.context.annotation.Configuration;
// import org.springframework.http.HttpMethod;
// import
// org.springframework.security.config.annotation.web.builders.HttpSecurity;
// import org.springframework.security.config.http.SessionCreationPolicy;
// import org.springframework.security.core.userdetails.User;
// import org.springframework.security.core.userdetails.UserDetailsService;
// import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
// import org.springframework.security.provisioning.InMemoryUserDetailsManager;
// import org.springframework.security.core.userdetails.UserDetails;
// import org.springframework.security.web.SecurityFilterChain;

// import lombok.AllArgsConstructor;

// import static org.springframework.security.config.Customizer.withDefaults;

// @Configuration
// @AllArgsConstructor
// public class mySecurityConfig {

// private BCryptPasswordEncoder passwordEncoder;

// @Bean
// public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
// http
// .csrf((csrf) -> csrf.disable())
// .authorizeHttpRequests((requests) -> requests
// .requestMatchers(HttpMethod.GET, "/ambulance/**").permitAll()
// .requestMatchers("/amublance/**").hasRole("ADMIN")
// .anyRequest().authenticated())
// .httpBasic(withDefaults())
// .sessionManagement((session) -> session
// .sessionCreationPolicy(SessionCreationPolicy.STATELESS));
// return http.build();
// }

// @Bean
// public UserDetailsService users() {
// UserDetails admin = User.builder()
// .username("admin")
// .roles("ADMIN")
// .password(passwordEncoder.encode("admin-pass"))
// .build();
// UserDetails user = User.builder()
// .username("user")
// .roles("USER")
// .password(passwordEncoder.encode("user-pass"))
// .build();
// return new InMemoryUserDetailsManager(admin, user);
// }
// }
