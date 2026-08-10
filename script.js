const canvas=document.getElementById("particle-bg");
const ctx=canvas.getContext('2d');

let width=canvas.width=window.innerWidth;
let height=canvas.height=window.innerHeight;

window.addEventListener('resize',()=>
{    
    let width=canvas.width=window.innerWidth;
    let height=canvas.height=window.innerHeight;
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
        this.vx=(Math.random()-0.5)*1.5;
        this.vy=(Math.random()-0.5)*1.5;
        this.size=Math.random()*2+1;
    }

    update()
    {
        this.x+=this.vx;
        this.y+=this.vy;
        if(this.x<0||this.x>width)this.vx*=-1;
        if(this.y<0||this.y>height)this.vy*=-1;

    }

    draw()
    {
        ctx.fillStyle='rgba(255,255,255,0.5';
        ctx.beginPath();
        ctx.arc(this.x,this.y,this.size,0,Math.PI*2);
        ctx.fill();
    }
}

const particlesArray=Array.from({length:60},()=>new Particle());

function animate()
{
    ctx.clearRect(0,0,width,height);

    particlesArray.forEach((p,index)=>
    {
        p.update();
        p.draw();

        if(mouse.x!==null&&mouse!==null)
        {
            const dx=mouse.x-p.x;
            const dy=mouse.y-p.y;
            const dist=Math.sqrt(dx*dx+dy*dy);

            
            if(dist<mouse.radius)
            {
                ctx.strokeStyle=`rgba(255,255,255,${1-dist/mouse.radius})`;
                ctx.lineWidth=0.5;
                ctx.beginPath();
                ctx.moveTo(p.x,p.y);
                ctx.lineTo(mouse.x,mouse.y);
                ctx.stroke();

            }
        }
    });
    requestAnimationFrame(animate);
}

animate();
