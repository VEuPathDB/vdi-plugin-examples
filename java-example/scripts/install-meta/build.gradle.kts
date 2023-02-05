plugins {
  java
  id("com.github.johnrengelman.shadow") version "7.1.2"
}

java {
  sourceCompatibility = JavaVersion.VERSION_17
  targetCompatibility = JavaVersion.VERSION_17
}

tasks.shadowJar {
  manifest {
    attributes["Main-Class"] = "script.Main"
  }

  archiveFileName.set("install-meta.jar")
}