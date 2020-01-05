version 1.0

workflow HelloWorld {
  call WriteGreeting
}

task WriteGreeting {

  input {
      String greeting
  }

  command {
     echo "${greeting}"
  }

  output {
     File output_greeting = stdout()
  }
}
