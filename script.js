const canvas=document.getElementById("particle-bg");
const ctx=canvas.getContext('2d');
const gravityForce=0.5;
const friction=0.999;
const amount=50;

let width=canvas.width=window.innerWidth;
let height=canvas.height=window.innerHeight;

window.addEventListener('resize',()=>
{    
    width=canvas.width=window.innerWidth;
    height=canvas.height=window.innerHeight;
});

const mouse={x:null,y:null,radius:200};

window.addEventListener('mousemove',(e)=>
{
    mouse.x=e.clientX;
    mouse.y=e.clientY;
});

window.addEventListener('mouseleave',()=>
{
    mouse.x=null;
    mouse.y=null;
});

class Particle
{
    constructor()
    {
        this.x=Math.random()*width;
        this.y=Math.random()*height;
        this.vx=(Math.random()-0.5)*10;
        this.vy=(Math.random()-0.5)*10;
        this.size=Math.random()*2+1;
        this.friction=friction;
    }

    update()
    {
        this.vx*=this.friction;
        this.vy*=this.friction;
        this.x+=this.vx;
        this.y+=this.vy;
        if(this.x<0||this.x>width)this.vx*=-1;
        if(this.y<0||this.y>height)this.vy*=-1;

    }

    draw()
    {
        ctx.fillStyle='rgba(255,255,255,0.5)';
        ctx.beginPath();
        ctx.arc(this.x,this.y,this.size,0,Math.PI*2);
        ctx.fill();
    }
}

const particlesArray=Array.from({length:amount},()=>new Particle());

function animate()
{
    ctx.clearRect(0,0,width,height);

    particlesArray.forEach((p,index)=>
    {
        if(mouse.x!==null&&mouse!==null)
        {
            const dx=mouse.x-p.x;
            const dy=mouse.y-p.y;
            const dist=Math.sqrt(dx*dx+dy*dy);
 
            if(dist<mouse.radius)
            {
                const safeDist=Math.max(dist,30);
                
                const force=(1-dist/mouse.radius)*gravityForce;

                p.vx+=(dx/safeDist)*force;
                p.vy+=(dy/safeDist)*force;
                
                ctx.strokeStyle=`rgba(255,255,255,${1-dist/mouse.radius})`;
                ctx.lineWidth=0.5;
                ctx.beginPath();
                ctx.moveTo(p.x,p.y);
                ctx.lineTo(mouse.x,mouse.y);
                ctx.stroke();

            }
        }

        p.update();
        p.draw();
    });
    requestAnimationFrame(animate);
}

animate();
