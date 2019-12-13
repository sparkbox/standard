# Sparkbox Development Process
We believe in rapid iteration through four phases of software development: discover, build, improve, and release. This iteration happens repeatedly through the course of a project.

## **Discover**
The discover phase ensures that we have what we need to build the right thing for our clients.

### Define Success
Collaboratively defining what a successful engagement will look like upfront is critical to managing expectations both from a technical and a business perspective. That doesn’t mean that those requirements won’t evolve over the course of an engagement, but it does ensure that we’re all starting off on the same foot.

### Create A Technical Vision
A well-documented technical vision is paramount to ensuring that we’re setting our development teams up for success in the build phase of our project. It’s critical that we understand exactly what we’re going to build and how we’re going to approach it from a technical standpoint. A technical vision has many components to it:
- **The technologies to be used on the project**: After we know the business problems we’re trying to solve, it’s time to research which technologies are going to help us solve those problems most effectively. We don’t mold a project to fit a certain technology; we ensure we’re using the right technology for the project.
- **A list of project milestones**: We’ll talk more about transparency during the build phase, but having a list of our milestones allows us to keep making steady progress towards our end goal while providing us with distinct sections to demo to our clients throughout the engagement.
- **Well-groomed tasks**: These tasks should outline the necessary work for each project milestone. We believe that any developer should feel empowered to pick up any available card during their time in the build phase. To enable this, we ensure that our tasks are very clearly scoped and include any context or technical references necessary for it to be completed.
- **A dependency map**: This should show the order that our tasks need to be completed in. If there’s work that needs done before bringing a larger team on board or if there are obvious bottlenecks during the build phase, we need to plan for that so we’re never blocking progress.
- **A list of potential project risks**: Outlining our risks ahead of time allows us to shine a light on them sooner rather than later in the build phase. We want our cone of uncertainty, or the potential effect that those risks will have on our project, to be as small as possible. Finding a way to complete the more risky or unknown tasks as early as possible in the build phase allows for this.

## **Build**
The build phase is where most of our software is created. In this phase, we provide enough structure to inspire confidence in the products we are creating while still allowing flexibility and iteration on the project requirements.

### Gain Confidence Through Automation
- Automated build pipeline
    - Create the ability to quickly run the application through a gauntlet of tests and obstacles to ensure it’s ready for production before it gets there.
- Automated Tests
    - **Unit Tests**: Test the methods and functions that make our application tick from an atomic level.
    - **Integration Tests**: Test the seams that are created when distinct pieces of our application are put together.
    - **Contract Tests**: Test the expectations we have of our service and data calls.
    - **User Journey Tests**: Test the experience that our users will have with our software by simulating their journeys through it (when applicable).
    - **Synthetic Monitoring**: Test our deployed software in the real world.

### Document Everything
As a consultancy, we know we won’t always be around for our clients. Our goal isn’t to create a dependency on us but rather to empower them to fully adopt and embrace the work we do. This requires them to know how to change, maintain, and extend the software built for them.
- Documentation for the business
    - All software exists to solve a business problem, which means even folks who were not involved in planning or building it often need to interact with it . We need to provide them with any tools and documentation needed to do this easily.
- Documentation for the development team
    - Technical documentation is critical both during and after the software is in the build or improve phases. It allows the current development team to understand the software being built around them, and it allows any future development team to understand the context and reasoning behind why features were implemented.

## **Improve**
The improve phase is where we gain insights through feedback. This could mean changing what we’re building based on stakeholder or user feedback, and that’s ok. This happens fairly often and is part of ensuring that we’re building the right thing. This is the portion of our process that allows us to be flexible.

### Enable Short Feedback Loops
Short feedback loops in development are important in enabling quick iterations. Without the ability to change and deploy software from a development perspective, we cannot get new code in front of our stakeholders for review in a timely fashion. We address this by creating the automated deployment pipelines and testing suites mentioned in the build phase. When things change, as they often do in the improve phase, it’s important to keep those items up-to-date so they continue to serve the development team and enable their progress.

Short feedback loops from a stakeholder and user perspective ensure we are collectively marching towards the right thing. By releasing early, we can get a feature’s MVP (minimum viable product) in front of stakeholders to gain insights in the direction we’re going. This allows us to make changes while a feature is in development instead of waiting until it’s finished before learning that it wasn’t quite right.

## **Release**
The release phase is when we begin sending our built artifacts to production.

### Release Early
We don’t believe in a “big bang” release structure, as this presents too much risk and not enough flexibility to ensure we’re building the right thing early on. We believe in releasing the smallest parts of our application as early as possible. This makes the flexibility required in our improve phase possible.

### Release Often
Through the use of [feature flags](https://seesparkbox.com/foundry/feature_flags_continuous_deployment), we can ensure that we can track our changes and roll them back quickly without a separate deploy. This mitigates a lot of the risk in deploying new features.
