# AI Animal Tracking and Deterrent System

## Overview

AI Animal Tracking and Deterrent System is an Android + Arduino based project designed to detect animals in real time and automatically track them using a pan-tilt mechanism.

The system uses TensorFlow Lite object detection running on an Android smartphone and communicates with an Arduino through USB OTG.

When an animal is detected, the system:

- Stops scanning mode
- Locks onto the target
- Tracks horizontal movement using a pan servo
- Tracks vertical movement using dual tilt servos
- Can activate deterrent motors automatically

When no animal is detected, the system resumes scanning mode.

---

## Features

- Real-time animal detection
- TensorFlow Lite object detection
- Android camera processing
- Arduino servo control
- Pan-Tilt tracking
- USB OTG communication
- Automatic scanning mode
- Target lock mode
- Expandable deterrent system

---

## Supported Animals

### COCO Model

- Cow
- Dog
- Cat
- Horse
- Sheep
- Bird
- Elephant
- Bear
- Zebra
- Giraffe

### Custom Model (Optional)

- Goat
- Monkey
- Deer
- Buffalo
- Any trained animal class

---

## System Architecture

Android Camera
↓
TensorFlow Lite
↓
Animal Detection
↓
Tracking Algorithm
↓
USB Serial Communication
↓
Arduino UNO
↓
Pan Servo + Dual Tilt Servos
↓
Target Tracking

---

## Hardware Used

| Component | Quantity |
|------------|------------|
| Arduino Uno | 1 |
| Android Smartphone | 1 |
| MG996R Servo | 3 |
| USB OTG Adapter | 1 |
| External 5V Power Supply | 1 |
| L298N Motor Driver | 1 |
| DC Motors | 2 |

---

## Servo Connections

| Function | Arduino Pin |
|-----------|------------|
| Pan Servo | D9 |
| Tilt Servo Left | D10 |
| Tilt Servo Right | D11 |

---

## Motor Driver Connections

| L298N Pin | Arduino Pin |
|------------|------------|
| IN1 | D5 |
| IN2 | D6 |
| IN3 | D7 |
| IN4 | D8 |

---

## Software Stack

- Android Studio
- Kotlin
- TensorFlow Lite
- CameraX
- Arduino IDE
- USB Serial for Android
