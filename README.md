# ecportfolio

![Nuxt.js](https://img.shields.io/badge/Nuxt.js-35495E?style=for-the-badge&logo=vue.js&logoColor=4FC08D)

![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/jdasilvalima/ec-portfolio?style=for-the-badge)
[![GitHub last commit](https://img.shields.io/github/last-commit/jdasilvalima/ec-portfolio?style=for-the-badge)](https://github.com/jdasilvalima/ec-portfolio/commits)

## I. PROJECT DESCRIPTION
### I.1 Introduction
**EcPortfolio** - is a website to showcase a photographer's work.

### I.2 Goals
The goal for this project was to create an interactive website while deepening my knowledge of modern frontend tools and techniques :

- Enhance frontend development skills using [Nuxt.js](https://nuxt.com/).
- Explore smooth scrolling techniques with [Lenis](https://lenis.darkroom.engineering/).
- Implement dynamic animations with [GSAP](https://gsap.com/) to create an engaging user experience.
- Get started with [WebGL](https://webgl2fundamentals.org/) and [Three.js](https://threejs.org/) to explore 3D web graphics

## II. PROJECT SETUP
### II.1 Requirements and Instructions
- [Docker](https://www.docker.com/) neeeds to be installed

Clone this project
```sh
    mkdir ecportfolio
    git clone git@github.com:jdasilvalima/ecportfolio.git
```

Build and run locally :
```sh
    docker build -t ec-portfolio .
    docker run -p 5173:5173 --rm --name ec-portfolio-nuxt-app ec-portfolio
```

## II.2 APPLICATION ARCHITECTURE
The following schema illustrates how the components in the application are interconnected and their hierarchical relationships.

![FrontEnd Architecture](./readme-doc/fe-architecture.png)


## III. REFERENCES
### III.1 Mesh Gradiant
* [The Book of Shaders - Noise](https://thebookofshaders.com/11/)
* [Gradient Flow](https://www.shadertoy.com/view/wdyczG)
* [Noise & Gradient](https://www.noiseandgradient.com/?chaos=0.2&colors=%23ed625d-%2342b6c6-%23f79f88-%23b2dfe6-%2303232d-%23ffffff&grain=0.15)

### III.2 WebGL
* [Learn WebGL](https://learnwebgl.brown37.net/)
* [Shadertoy](https://www.shadertoy.com/)